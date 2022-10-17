import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/pages/user_rating_page.dart';
import 'package:reciapp/pages/user_recipes_page.dart';
import '../components/head_bar.dart';
import '../components/copyright.dart';
import '../components/sidebar_menu.dart';
import '../login_support/check_auth.dart';
import '../login_support/user_preference.dart';
import '../object/get_posts_homepage.dart';
import '../object/user_info.dart';
import 'collection_page.dart';
import '../object/recipe_review.dart';
import 'package:http/http.dart' as http;

class IconDetail extends StatelessWidget {
  final IconData icon;
  final Color color;
  final int number;
  final String text;
  final dynamic page;
  const IconDetail(
      {super.key,
      required this.color,
      required this.number,
      required this.icon,
      required this.text,
      required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          iconSize: 40,
          color: color,
          icon: Icon(icon),
          tooltip: text,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => page,
            ));
          },
        ),
        Text(
          '$number',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}

class UserProfile extends StatefulWidget {
  final UserInfoProvider userInfoProvider;
  const UserProfile({
    required this.userInfoProvider,
    super.key
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final controller = ScrollController();
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  Future fetchInfinitePosts(int userId) async {
    userId = 4;
    if (isLoading) return;
    isLoading = true;
    const limit = 6;
    http.Response response = await http.get(
      Uri.parse(
          'https://reciapp.azurewebsites.net/api/user/$userId/post/page/$page?PageSize=$limit'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      setState(() {
        //final List jsonData = responseJson['data'];
        isLoading = false;
        page++;
        if (responseJson['data'].length < limit) {
          hasMore = false;
        }
        _listReciepReviews.addAll(responseJson['data']
            .map<GetPosts>((p) => GetPosts.fromJson(p))
            .toList());
      });
    }
  }

  int userId = 0;

  @override
  void initState() {
    super.initState();
    if (widget.userInfoProvider.name.isEmpty) {
      UserData userData =
          UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
      widget.userInfoProvider.userID = userData.userID;
      widget.userInfoProvider.imageURL = userData.imageURL;
      widget.userInfoProvider.name = userData.name;
      widget.userInfoProvider.token = userData.token;
      widget.userInfoProvider.role = userData.role;
      widget.userInfoProvider.mail = userData.mail;
    }
    fetchInfinitePosts(widget.userInfoProvider.userID);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchInfinitePosts(widget.userInfoProvider.userID);
        print(' more');
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final List<GetPosts> _listReciepReviews = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: HeadBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Container(
                margin: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Image(
                        image: NetworkImage(widget.userInfoProvider.imageURL),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.userInfoProvider.name,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 20),
                        Text(widget.userInfoProvider.mail)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.orange, width: 2.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconDetail(
                    icon: Icons.assignment,
                    color: Colors.red,
                    number: 3,
                    text: "Press to your recipes",
                    page: UserRecipesPage(widget.userInfoProvider.userID),
                  ),
                  IconDetail(
                    icon: Icons.bookmark,
                    color: Colors.blue,
                    number: 20,
                    text: "Press to your bookmarks",
                    page: CollectionPage(widget.userInfoProvider.userID),
                  ),
                  IconDetail(
                    icon: Icons.star_outlined,
                    color: Colors.yellow,
                    number: 15,
                    text: "Press to your ratings",
                    page: UserRatingsPage(widget.userInfoProvider.userID),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                children: const [
                  Icon(Icons.assignment),
                  Text(
                    ' Recently Recipes',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              ),
            ),
            ListRecipeReview(0.5, _listReciepReviews, controller, hasMore)
          ]),
        ),
      ),
      bottomNavigationBar: const Copyright(),
    );
  }
}

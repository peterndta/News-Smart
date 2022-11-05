import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/components/bottom_bar.dart';
import 'package:reciapp/pages/create_recipe_page.dart';
import 'package:reciapp/pages/user_rating_page.dart';
import 'package:reciapp/pages/user_recipes_page.dart';
import '../login_support/auth_service.dart';
import '../login_support/check_auth.dart';
import '../login_support/user_preference.dart';
import '../main.dart';
import '../object/auth_recipe_review.dart';
import '../object/get_posts_homepage.dart';
import '../object/user_info.dart';
import 'user_bookmark_page.dart';
import 'package:http/http.dart' as http;

class IconDetail extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final dynamic page;
  const IconDetail(
      {super.key,
      required this.color,
      required this.icon,
      required this.text,
      required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          iconSize: 30,
          color: color,
          icon: Icon(icon),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => page,
            ));
          },
        ),
        Text(
          'Your $text',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        )
      ],
    );
  }
}

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final controller = ScrollController();
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  Future fetchInfinitePosts() async {
    if (isLoading) return;
    isLoading = true;
    const limit = 6;
    http.Response response = await http.get(
      Uri.parse(
          'https://reciapp.azurewebsites.net/api/user/${userData?.userID}/post/page/$page?PageSize=$limit'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData?.token}'
      },
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      if (!mounted) return;
      setState(() {
        isLoading = false;
        page++;
        if (responseJson['data'].length < limit) {
          hasMore = false;
        }
        _listReciepReviews.addAll(responseJson['data']
            .map<GetPosts>((p) => GetPosts.fromJson(p))
            .toList());
      });
    } else if (response.statusCode == 400) {
      setState(() {
        hasMore = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    userData = UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
    fetchInfinitePosts();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchInfinitePosts();
      }
    });
  }

  UserData? userData;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final List<GetPosts> _listReciepReviews = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile',
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.orange,
        titleTextStyle: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              final getUserInfo =
                  Provider.of<UserInfoProvider>(context, listen: false);
              getUserInfo.token = '';
              getUserInfo.role = '';
              getUserInfo.mail = '';
              getUserInfo.userID = 0;
              getUserInfo.name = '';
              getUserInfo.imageURL = '';
              AuthService().signOut();
              //      logoutAuth();

              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const MyApp())));
            },
          ),
        ],
      ),
      bottomNavigationBar: bottomMenuBar(context, 'profile'),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(userData!.imageURL),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(userData!.name,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(height: 20),
                          const Text(
                            'Email:',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            userData!.mail,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 2),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.orange, width: 2.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconDetail(
                    icon: Icons.assignment,
                    color: Colors.red,
                    text: "recipes",
                    page: UserRecipesPage(),
                  ),
                  IconDetail(
                    icon: Icons.bookmark,
                    color: Colors.blue,
                    text: "bookmarks",
                    page: BookmarkPage(),
                  ),
                  IconDetail(
                    icon: Icons.star_outlined,
                    color: Colors.yellow,
                    text: "ratings",
                    page: UserRatingsPage(),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                children: const [
                  Icon(Icons.assignment),
                  Text(
                    ' Recently Recipes',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
            ListAuthRecipeReview(
                0.49, _listReciepReviews, controller, hasMore, "profile")
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateRecipePage(),
          ));
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/object/get_posts_homepage.dart';
import 'package:reciapp/object/user_info.dart';
import 'package:reciapp/pages/recipes_page.dart';
import '../components/copyright.dart';
import '../components/head_bar.dart';
import '../components/sidebar_menu.dart';

import '../login_support/check_auth.dart';
import '../login_support/user_preference.dart';
import 'package:http/http.dart' as http;

import '../object/recipe_review.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          'https://reciapp.azurewebsites.net/api/post/page/$page?PageSize=$limit'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final List<GetPosts> _listReciepReviews = [];
  @override
  void initState() {
    super.initState();
    loadData();
    fetchInfinitePosts();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchInfinitePosts();
        print(' more');
      }
    });
  }

  loadData() async {
    if (userInfoProvider == null) {
      Timer(Duration(seconds: 4), () {
        if (!mounted) return;
        final getUserID = Provider.of<UserInfoProvider>(context, listen: false);
        setState(() {
          if (getUserID.imageURL.isEmpty) {
            UserData userData =
                UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
            getUserID.userID = userData.userID;
            getUserID.imageURL = userData.imageURL;
            getUserID.name = userData.name;
            getUserID.token = userData.token;
            getUserID.role = userData.role;
            getUserID.mail = userData.mail;
          }
          userInfoProvider = getUserID;
        });
      });
    }
    return;
  }

  UserInfoProvider? userInfoProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: HeadBar(),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 0.8))),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => RecipesPage())));
                              },
                              child: Text(
                                'Latest Post',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListRecipeReview(
                        0.5, _listReciepReviews, controller, hasMore)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Copyright(),
    );
  }
}

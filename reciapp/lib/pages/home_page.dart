// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reciapp/components/bottom_bar.dart';
import 'package:reciapp/object/get_posts_homepage.dart';
import 'package:reciapp/pages/loading_page.dart';
import 'package:reciapp/pages/recipes_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/head_bar.dart';

import 'package:http/http.dart' as http;

import '../object/recipe_review.dart';
import '../object/user_info.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.imageUrl, super.key});
  String imageUrl;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final controller = ScrollController();
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  Future fetchInfinitePosts() async {
    if (isLoading) return;
    isLoading = true;
    const limit = 6;
    SharedPreferences data = await SharedPreferences.getInstance();
    UserData userData =
        UserData.fromJson(jsonDecode(data.getString('user') as String));
    // print('Call: ' +
    //     'https://reciapp.azurewebsites.net/api/recipes/post/page/$page?PageSize=$limit');
    http.Response response = await http.get(
      Uri.parse(
          'https://reciapp.azurewebsites.net/api/recipes/post/page/$page?PageSize=$limit'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData.token}'
      },
    );
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      // print(responseJson);
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
    } else {
      // print(responseJson);
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
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchInfinitePosts();
        print(' more');
      }
    });
  }

  Future getData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    if (data.getString('user') == null) {
      setState(() {});
    } else {
      fetchInfinitePosts();
      return data.getString('user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(55),
                child: HeadBar(),
              ),
              bottomNavigationBar: bottomMenuBar(context, 'home'),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: MediaQuery.of(context).size.height * 0.9,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              width: MediaQuery.of(context).size.width * 0.63,
                              height: MediaQuery.of(context).size.height * 0.15,
                              fit: BoxFit.fill,
                              image: AssetImage('assets/logo.png'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
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
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 0.8))),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    RecipesPage())));
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
                            // FutureBuilder(
                            //     future: fetchInfinitePosts()
                            //         .whenComplete(() => 'ok'),
                            //     builder: (context, snapshot) {
                            //       if (snapshot.hasData) {
                            // return
                            ListRecipeReview(
                                0.55, _listReciepReviews, controller, hasMore)
                            // ;
                            //   }
                            //   return CircularProgressIndicator();
                            // })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return LoadingPage();
        });
  }
}

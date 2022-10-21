// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/object/get_posts_homepage.dart';
import 'package:reciapp/object/user_info.dart';
import 'package:reciapp/pages/recipes_page.dart';
import 'package:simple_star_rating/clip_half.dart';
import '../components/copyright.dart';
import '../components/head_bar.dart';
import '../components/sidebar_menu.dart';
import '../components/back_to_top_button.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../login_support/check_auth.dart';
import '../login_support/user_preference.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  @override
  void initState() {
    scrollController.addListener(() {
      //scroll listener
      double showoffset =
          10.0; //Back to top botton will show on scroll offset 10.0
      if (scrollController.offset > showoffset) {
        showbtn = true;
        setState(() {
          //update state
        });
      } else {
        showbtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
    loadData();
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
    // final getUserInfo = Provider.of<UserInfoProvider>(context, listen: false);
    //print(
    //    'token: ${getUserInfo.token}, role: ${getUserInfo.role}, id: ${getUserInfo.userID}, mail: ${getUserInfo.mail}, name: ${getUserInfo.name}, image url: ${getUserInfo.imageURL}');
    // print('token: ${getUserInfo.token}');
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
          controller: scrollController,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1.18,
                      child: FutureBuilder(
                          future: fetchPosts(),
                          builder: ((context, snapshot) {
                            if (snapshot.data == null) {
                              return Container();
                            } else {
                              return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      //   onTap: () {
                                      //   Navigator.of(context).push(MaterialPageRoute(
                                      //       builder: (context) => /**foward đến recipe detail của recipe vừa bấm */));
                                      // },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.5))),
                                        child: Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 20, 0, 15),
                                          child: Row(
                                            children: [
                                              Image(
                                                image: NetworkImage(snapshot
                                                    .data[index].imageUrl),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.14,
                                                fit: BoxFit.fill,
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.45,
                                                      child: Text(
                                                        snapshot
                                                            .data[index].name,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                    snapshot.data[index]
                                                                .userId ==
                                                            userInfoProvider
                                                                ?.userID
                                                        ? Icon(
                                                            Icons.bookmark,
                                                            color: Colors.black,
                                                          )
                                                        : Container(),
                                                    Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 3),
                                                      child: Row(
                                                        children: [
                                                          SmoothStarRating(
                                                            isReadOnly: true,
                                                            size: 28,
                                                            color: Colors
                                                                .amber[600],
                                                            rating: snapshot
                                                                .data[index]
                                                                .averageRating
                                                                .toDouble(),
                                                            borderColor: Colors
                                                                .amber[600],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                        child: Text(snapshot
                                                            .data[index]
                                                            .description)),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 15),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.28,
                                                            child: const Text(
                                                              'By ',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.02),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.2,
                                                            child: Text(
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              snapshot
                                                                  .data[index]
                                                                  .userName
                                                                  .toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                          })),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BackToTopButton(scrollController, showbtn),
      bottomNavigationBar: Copyright(),
    );
  }
}

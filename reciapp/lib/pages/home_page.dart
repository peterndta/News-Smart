// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/object/get_posts_homepage.dart';
import 'package:reciapp/pages/recipes_result_page.dart';
import 'package:simple_star_rating/clip_half.dart';
import '../components/copyright.dart';
import '../components/head_bar.dart';
import '../components/sidebar_menu.dart';
import '../components/back_to_top_button.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../login_support/check_auth.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    final getUserID = Provider.of<UserIDProvider>(context, listen: false);
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: HeadBar(),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
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
              Column(
                children: [
                  Row(
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
                                builder: ((context) => RecipesResult())));
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
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
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.5),
                                              top: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.5))),
                                      child: Row(
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                snapshot.data[index].imageUrl),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.14,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data[index].name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                                textAlign: TextAlign.end,
                                              ),
                                              snapshot.data[index].userId ==
                                                      getUserID.userID
                                                  ? Icon(
                                                      Icons.bookmark,
                                                      color: Colors.black,
                                                    )
                                                  : Container(),
                                              Row(
                                                children: [
                                                  SmoothStarRating(
                                                    isReadOnly: true,
                                                    size: 16,
                                                    color: Colors.amber[600],
                                                    rating: snapshot.data[index]
                                                        .averageRating
                                                        .toDouble(),
                                                    borderColor:
                                                        Colors.amber[600],
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: Text(snapshot
                                                      .data[index]
                                                      .description)),
                                              Row(
                                                children: [
                                                  Text('by '),
                                                  Text(
                                                    snapshot
                                                        .data[index].userName,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }
                        })),
                  ),
                ],
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

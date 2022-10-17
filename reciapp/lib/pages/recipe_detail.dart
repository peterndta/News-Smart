// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/object/post_detail.dart';
import 'package:reciapp/object/step_iteam.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import '../components/copyright.dart';
import '../components/head_bar.dart';
import '../components/sidebar_menu.dart';
import '../components/back_to_top_button.dart';
import 'package:http/http.dart' as http;

import '../login_support/check_auth.dart';
import '../object/get_posts_homepage.dart';

class RecipeDetailPage extends StatefulWidget {
  final String id;
  final String token;
  RecipeDetailPage({required this.id, required this.token});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;
  Future fetchPosts(String id, String token) async {
    print('Bearer $token');
    http.Response response = await http.get(
      Uri.parse('https://reciapp.azurewebsites.net/api/post/$id'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      print(responseJson['data']);
      GetPosts post = GetPosts.fromJson(responseJson['data']);
      return post;
    }
  }

  Future fetchStep(String postId, String token) async {
    http.Response response = await http.get(
      Uri.parse('https://reciapp.azurewebsites.net/api/post/$postId/step'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      print(responseJson['data']);
      StepItem step = StepItem.fromJson(responseJson['data']);
      return step;
    }
  }

  Future fetchData(String id, String token) async {
    final post = await fetchPosts(id, token);
    final step = await fetchStep(id, token);
    PostDetail postDetail = PostDetail.fromJson(post.toJson(), step.toJson());
    return postDetail;
  }

  @override
  void initState() {
    fetchPosts(widget.id, widget.token);
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
    return Scaffold(
        drawer: SideBarMenu(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: HeadBar(),
        ),
        floatingActionButton: BackToTopButton(scrollController, showbtn),
        body: FutureBuilder(
            future: fetchData(widget.id, widget.token),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                  // controller: scrollController,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              snapshot.data.name,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Ink(
                                  decoration: BoxDecoration(
                                    // border: Border.all(width: 1),
                                    color: Colors.orange,
                                  ),
                                  child: InkWell(
                                    //borderRadius: BorderRadius.circular(100.0),
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.bookmark_border,
                                        size: 25.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 1),
                                Ink(
                                  decoration: BoxDecoration(
                                    // border: Border.all(width: 1),
                                    color: Color.fromARGB(255, 221, 218, 218),
                                  ),
                                  child: InkWell(
                                    //borderRadius: BorderRadius.circular(100.0),
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.star_outline,
                                        size: 25.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          SimpleStarRating(
                            allowHalfRating: true,
                            starCount: 5,
                            rating: snapshot.data.averageRating * 1.0,
                            size: 15,
                            spacing: 10,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${snapshot.data.averageRating}',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Image(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.25,
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            '${snapshot.data.imageUrl}',
                          ),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Preparing',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('${snapshot.data.preparingTime} minutes')
                              ],
                            ),
                            VerticalDivider(
                              width: 30,
                              thickness: 1,
                              // indent: 10,
                              // endIndent: 0,
                              color: Colors.grey,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Processing',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('${snapshot.data.processingTime} minutes')
                              ],
                            ),
                            const VerticalDivider(
                              width: 30,
                              thickness: 1,
                              // indent: 10,
                              // endIndent: 0,
                              color: Colors.grey,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Cooking',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('${snapshot.data.cookingTime} minutes')
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.orange,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Preparing',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        WidgetSpan(
                                          child: Icon(Icons.people, size: 14),
                                        ),
                                        TextSpan(
                                            text: " Serving: ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            )),
                                        TextSpan(
                                            text:
                                                "${snapshot.data.serving} people",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ))
                                      ]))
                                    ],
                                  ),
                                )),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ingredients:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      WidgetSpan(
                                          child: Icon(Icons.circle, size: 8),
                                          alignment:
                                              PlaceholderAlignment.middle),
                                      TextSpan(
                                          text: " ${snapshot.data.ingredient}",
                                          style: TextStyle(
                                            color: Colors.black,
                                          )),
                                    ])),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Tool needed:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      WidgetSpan(
                                          child: Icon(Icons.circle, size: 8),
                                          alignment:
                                              PlaceholderAlignment.middle),
                                      TextSpan(
                                          text: " ${snapshot.data.tool}",
                                          style: TextStyle(
                                            color: Colors.black,
                                          )),
                                    ])),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.orange,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Processing',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text('${snapshot.data.processing}'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.orange,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Cooking',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                '${snapshot.data.cooking}',
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.orange,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Nutrion Facts',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                  '152 calories; protein 13.1g; carbohydrates 4.2g; fat 8.9g; cholesterol 36.9mg; sodium 67.6mg.'),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 20),
                                alignment: Alignment.topRight,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Recipe by ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 119, 118, 118)),
                                    children: [
                                      TextSpan(
                                          text: '${snapshot.data.userName}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            }));
  }
}

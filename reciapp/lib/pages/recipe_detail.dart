// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reciapp/object/post_detail.dart';
import 'package:reciapp/object/step_iteam.dart';
import 'package:reciapp/pages/update_recipe_page.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../components/head_bar.dart';
import '../components/sidebar_menu.dart';
import 'package:http/http.dart' as http;

import '../login_support/user_preference.dart';
import '../object/get_posts_homepage.dart';
import '../object/user_info.dart';

class Rating {
  Rating({
    required this.rating,
  });

  int rating;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
      };
}

class Bookmark {
  Bookmark({
    required this.bookmark,
  });

  bool bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        bookmark: json["bookmark"],
      );

  Map<String, dynamic> toJson() => {
        "bookmark": bookmark,
      };
}

class RecipeDetailPage extends StatefulWidget {
  final String id;
  final String token;
  RecipeDetailPage({required this.id, required this.token});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  Future fetchPosts(String id, String token) async {
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
      GetPosts post = GetPosts.fromJson(responseJson['data']);
      return post;
    } else {
      print('Error: ' + json.decode(response.body));
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
      StepItem step = StepItem.fromJson(responseJson['data']);
      return step;
    } else {
      print('Error: ' + json.decode(response.body));
    }
  }

  Future fetchData(String id, String token) async {
    final post = await fetchPosts(id, token);
    final step = await fetchStep(id, token);
    PostDetail postDetail = PostDetail.fromJson(post.toJson(), step.toJson());
    if (postDetail.userId == userData.userID) {
      checkAuth = true;
    }
    return postDetail;
  }

  Future ratingPost(String postId, String token, int rating) async {
    http.Response response = await http.post(
      Uri.parse('https://reciapp.azurewebsites.net/api/post/$postId/rating'),
      body: json.encode(Rating(rating: rating).toJson()),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      setState(() {});
    } else {
      print('Error: ' + json.decode(response.body));
    }
  }

  Future bookmarkPost(String postId, String token, bool bookmark) async {
    http.Response response = await http.post(
      Uri.parse('https://reciapp.azurewebsites.net/api/post/$postId/bookmark'),
      body: json.encode(Bookmark(bookmark: bookmark).toJson()),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {});
    }
  }

  bool checkAuth = false;
  UserData userData =
      UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
  @override
  void initState() {
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
        body: FutureBuilder(
            future: fetchData(widget.id, widget.token),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                YoutubePlayerController? controller;
                controller = YoutubePlayerController(
                  initialVideoId:
                      YoutubePlayer.convertUrlToId(snapshot.data.videoUrl)
                          as String,
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                    loop: false,
                    forceHD: false,
                    isLive: false,
                    disableDragSeek: false,
                  ),
                );
                return SingleChildScrollView(
                  // controller: scrollController,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Ink(
                            decoration: BoxDecoration(
                              color: (snapshot.data.bookmark)
                                  ? Colors.orange
                                  : Color.fromARGB(255, 219, 214, 214),
                            ),
                            child: InkWell(
                              onTap: () {
                                bookmarkPost(widget.id, widget.token,
                                    !snapshot.data.bookmark);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.bookmark_border_outlined,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 3),
                          Ink(
                            decoration: BoxDecoration(
                              color: (snapshot.data.rating != null)
                                  ? Colors.orange
                                  : Color.fromARGB(255, 221, 218, 218),
                            ),
                            child: InkWell(
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
                          SizedBox(width: 3),
                          Ink(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 221, 218, 218),
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.flag,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 3),
                          checkAuth
                              ? Ink(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => UpdateRecipePage(
                                            postDetail: snapshot.data),
                                      ));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            size: 25.0,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Edit',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 35),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Row(
                            children: [
                              Text(
                                'Rating: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SimpleStarRating(
                                isReadOnly: (snapshot.data.rating != null)
                                    ? true
                                    : false,
                                onRated: (rate) {
                                  // if(rating != null){
                                  ratingPost(
                                      widget.id, widget.token, rate!.toInt());
                                  // }
                                },
                                allowHalfRating: true,
                                starCount: 5,
                                rating: snapshot.data.averageRating * 1.0,
                                size: 16,
                                spacing: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Method: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    snapshot.data.method,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.08,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Region: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    snapshot.data.continents,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            children: [
                              Text(
                                'Categories: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                snapshot.data.listCategories.join(', '),
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 2),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.orange,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'About this recipe',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                snapshot.data.description,
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            child: Image(
                              // width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.25,
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                '${snapshot.data.imageUrl}',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
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
                                    Text(
                                        '${snapshot.data.preparingTime} minutes')
                                  ],
                                ),
                                VerticalDivider(
                                  width: 40,
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
                                    Text(
                                        '${snapshot.data.processingTime} minutes')
                                  ],
                                ),
                                const VerticalDivider(
                                  width: 40,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 2),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          RichText(
                                              text: TextSpan(children: [
                                            WidgetSpan(
                                              child:
                                                  Icon(Icons.people, size: 14),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ingredients:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: RichText(
                                            text: TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(Icons.shopping_cart,
                                                  size: 10),
                                              alignment:
                                                  PlaceholderAlignment.middle),
                                          TextSpan(
                                              text:
                                                  " ${snapshot.data.ingredient}",
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
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: RichText(
                                            text: TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(Icons.shopping_bag,
                                                  size: 10),
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
                                  padding: EdgeInsets.only(bottom: 2),
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
                                  padding: EdgeInsets.only(bottom: 2),
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 2),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.orange,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Video',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              controller != null
                                  ? Container(
                                      margin: EdgeInsets.only(top: 10),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: YoutubePlayer(
                                        controller: controller,
                                        liveUIColor: Colors.amber,
                                      ),
                                    )
                                  : Center(
                                      child: Text('No videos'),
                                    )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    const WidgetSpan(
                                      child: Text(
                                        'By',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Text(
                                        snapshot.data.userName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
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

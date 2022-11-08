// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/components/textbox_form.dart';
import 'package:reciapp/object/post_detail.dart';
import 'package:reciapp/object/step_iteam.dart';
import 'package:reciapp/pages/update_recipe_page.dart';
import 'package:simple_star_rating/simple_star_rating.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../components/bottom_bar.dart';
import 'package:http/http.dart' as http;
import 'package:reciapp/components/textbox_form.dart';
import '../login_support/check_auth.dart';
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

class PostReport {
  PostReport({
    required this.postsId,
    required this.reason,
  });
  String postsId;
  String reason;
  factory PostReport.fromJson(Map<String, dynamic> json) => PostReport(
        postsId: json["postsId"],
        reason: json["reason"],
      );
  Map<String, dynamic> toJson() => {
        "postsId": postsId,
        "reason": reason,
      };
}

class RecipeDetailPage extends StatefulWidget {
  final String id;
  RecipeDetailPage({required this.id});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  Future fetchPosts(String id) async {
    UserData userData =
        UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
    http.Response response = await http.get(
      Uri.parse('https://reciapp.azurewebsites.net/api/post/$id'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData.token}'
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

  Future fetchStep(String postId) async {
    UserData userData =
        UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
    http.Response response = await http.get(
      Uri.parse('https://reciapp.azurewebsites.net/api/post/$postId/step'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData.token}'
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

  Future fetchData(String id) async {
    final post = await fetchPosts(id);
    final step = await fetchStep(id);
    PostDetail postDetail = PostDetail.fromJson(post.toJson(), step.toJson());
    if (postDetail.userId == userData.userID) {
      checkAuth = true;
    }
    return postDetail;
  }

  Future ratingPost(String postId, int rating) async {
    UserData userData =
        UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
    http.Response response = await http.post(
      Uri.parse('https://reciapp.azurewebsites.net/api/post/$postId/rating'),
      body: json.encode(Rating(rating: rating).toJson()),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData.token}'
      },
    );
    if (response.statusCode == 200) {
      setState(() {});
    } else {
      print('Error: ' + json.decode(response.body));
    }
  }

  Future bookmarkPost(String postId, bool bookmark) async {
    UserData userData =
        UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
    http.Response response = await http.post(
      Uri.parse('https://reciapp.azurewebsites.net/api/post/$postId/bookmark'),
      body: json.encode(Bookmark(bookmark: bookmark).toJson()),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData.token}'
      },
    );
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {});
    }
  }

  Future sendReport(int userId, String postId, String reason) async {
    http.Response response = await http.post(
      Uri.parse('https://reciapp.azurewebsites.net/api/user/$userId/report'),
      body: json.encode(PostReport(postsId: postId, reason: reason).toJson()),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData.token}'
      },
    );
    var responseJson = json.decode(response.body);
    print(responseJson);
    if (response.statusCode == 200) {
      // setState(() {});
      // Navigator.of(context).pop();
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController reportController = TextEditingController();

  Future confirmDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Confirm'),
            content: Text('Are you sure you want to continue?'),
            actions: [
              InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text('Cancel',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15))),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              InkWell(
                  onTap: () {
                    sendReport(
                            userData.userID, widget.id, reportController.text)
                        .whenComplete(
                      () => Navigator.of(context).pop(),
                    );
                    print(reportController.text);
                  },
                  child: Text('Confirm',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)))
            ],
          ));

  Future openDialog(/*BuildContext context*/) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Report'),
            content: Form(
              key: _formKey,
              child: TextBoxForm(
                text: 'Your report reason',
                controller: reportController,
                maxLines: 3,
              ),
            ),
            actions: [
              InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text('Close',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15))),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await confirmDialog();
                      Navigator.of(context).pop();
                    }
                    // await confirmDialog();
                    // Navigator.of(context).pop();
                  },
                  child: Text('Submit',
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)))
            ],
          ));

  bool checkAuth = false;
  UserData userData =
      UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getUserInfo = Provider.of<UserInfoProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Recipe Detail',
            style: GoogleFonts.satisfy(
              color: const Color.fromARGB(255, 59, 59, 61),
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.orange,
          titleTextStyle: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        bottomNavigationBar: bottomMenuBar(context, 'detail'),
        body: FutureBuilder(
            future: fetchData(widget.id),
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
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data.name,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 49, 48, 48),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Rating: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SimpleStarRating(
                                      isReadOnly: (snapshot.data.rating != null)
                                          ? true
                                          : false,
                                      onRated: (rate) {
                                        // if(rating != null){
                                        ratingPost(widget.id, rate!.toInt());
                                        // }
                                      },
                                      allowHalfRating: true,
                                      starCount: 5,
                                      rating: snapshot.data.averageRating * 1.0,
                                      size: 11,
                                      spacing: 10,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015),
                                Row(
                                  children: [
                                    Text(
                                      'Method: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      snapshot.data.method,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015),
                                Row(
                                  children: [
                                    Text(
                                      'Region: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      snapshot.data.continents,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.015,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Categories: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      snapshot.data.listCategories.join(', '),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Ink(
                                  decoration: BoxDecoration(
                                    color: (snapshot.data.bookmark == true)
                                        ? Colors.orange
                                        : Color.fromARGB(255, 221, 218, 218),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      bookmarkPost(
                                          widget.id, !snapshot.data.bookmark);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: snapshot.data.bookmark == true
                                          ? Icon(
                                              Icons.bookmark_added_outlined,
                                              size: 20,
                                              color: Colors.black,
                                            )
                                          : Icon(
                                              Icons.bookmark,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
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
                                        size: 20.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                                snapshot.data.isReport ||
                                        snapshot.data.userId ==
                                            getUserInfo.userID
                                    ? SizedBox()
                                    : Ink(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 221, 218, 218),
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            await openDialog();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.flag,
                                              size: 20.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                SizedBox(height: 3),
                                checkAuth
                                    ? Ink(
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateRecipePage(
                                                      postDetail:
                                                          snapshot.data),
                                            ));
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.edit,
                                              size: 20.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                snapshot.data.description,
                                style: TextStyle(fontSize: 11),
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
                              fit: BoxFit.cover,
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
                                          fontSize: 11),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                        '${snapshot.data.preparingTime} minutes',
                                        style: TextStyle(fontSize: 11))
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
                                          fontSize: 11),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                        '${snapshot.data.processingTime} minutes',
                                        style: TextStyle(fontSize: 11))
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
                                          fontSize: 11),
                                    ),
                                    SizedBox(height: 10),
                                    Text('${snapshot.data.cookingTime} minutes',
                                        style: TextStyle(fontSize: 11))
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
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
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
                                                    fontSize: 11)),
                                            TextSpan(
                                                text:
                                                    "${snapshot.data.serving} people",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11))
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
                                            fontSize: 15),
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
                                            fontSize: 15),
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
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
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
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
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
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
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
                                        'By ',
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

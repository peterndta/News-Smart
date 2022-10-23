// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:reciapp/components/filter_methods.dart';
import '../components/sidebar_menu.dart';
import '../components/copyright.dart';
import '../components/head_bar.dart';
import 'dart:convert';
import 'dart:io';
import '../login_support/user_preference.dart';
import '../object/get_posts_homepage.dart';
import '../object/recipe_review.dart';
import '../object/user_info.dart';
import 'package:http/http.dart' as http;

class CookingMethodsPage extends StatefulWidget {
  const CookingMethodsPage({super.key});

  @override
  State<CookingMethodsPage> createState() => _CookingMethodsPageState();
}

class _CookingMethodsPageState extends State<CookingMethodsPage> {
  @override
  void initState() {
    super.initState();
    fetchInfinitePosts(listMethods, keywords, 0);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchInfinitePosts(listMethods, keywords, 0);
      }
    });
  }

  final controller = ScrollController();
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  List<String> listMethods = [];
  String keywords = "";

  Future fetchInfinitePosts(
      List<String> methods, String keywords, int pages) async {
    if (isLoading) return;
    UserData userData =
        UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
    isLoading = true;
    const limit = 6;
    var methodsString = "";
    if (methods.isNotEmpty) {
      methodsString = "&Method=" + methods.join(",");
    }
    var search = "";
    if (keywords.isNotEmpty) {
      search = "&Search=" + keywords;
    }
    if (pages != 0) page = pages;
    print('Call: ' +
        'https://reciapp.azurewebsites.net/api/method/post/page/$page?PageSize=$limit$methodsString$search');
    http.Response response = await http.get(
      Uri.parse(
          'https://reciapp.azurewebsites.net/api/method/post/page/$page?PageSize=$limit$methodsString$search'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData.token}'
      },
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      if (!mounted) return;
      setState(() {
        //final List jsonData = responseJson['data'];
        isLoading = false;
        if (pages != 0) page = pages;
        page++;
        if (responseJson['data'].length < limit) {
          hasMore = false;
        }
        if (pages == 1) _listReciepReviews.clear();
        _listReciepReviews.addAll(responseJson['data']
            .map<GetPosts>((p) => GetPosts.fromJson(p))
            .toList());
      });
      print('Sucessfully');
    } else {
      print(json.decode(response.body));
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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: HeadBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.06,
                      color: Color.fromARGB(255, 255, 231, 185),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.5)),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        child: Text(
                          'Method',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Inter',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ListRecipeReview(0.7, _listReciepReviews, controller, hasMore)
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilterMethod(
              fetchInfinitePosts: fetchInfinitePosts,
              listMethods: listMethods,
              keywords: keywords,
              dispose: dispose),
        ],
      ),
      bottomNavigationBar: Copyright(),
    );
  }
}

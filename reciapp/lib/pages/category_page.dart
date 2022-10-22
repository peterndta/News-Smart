// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/components/infinite_scroll_category.dart';
// import '../components/filter_category.dart';
import '../components/filter_category.dart';
import '../components/sidebar_menu.dart';
import '../login_support/check_auth.dart';
import '../components/back_to_top_button.dart';
import '../components/copyright.dart';
import '../components/head_bar.dart';
import 'dart:convert';
import 'dart:io';

import '../login_support/user_preference.dart';
import '../object/get_posts_homepage.dart';
import '../object/recipe_review.dart';
import '../object/user_info.dart';
import 'package:http/http.dart' as http;

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
// ScrollController scrollController = ScrollController();
  // bool showbtn = false;
  // bool isSelected = false;

  @override
  void initState() {
    // scrollController.addListener(() {
    //   //scroll listener
    //   double showoffset =
    //       10.0; //Back to top botton will show on scroll offset 10.0

    //   if (scrollController.offset > showoffset) {
    //     showbtn = true;
    //     setState(() {
    //       //update state
    //     });
    //   } else {
    //     showbtn = false;
    //     setState(() {
    //       //update state
    //     });
    //   }
    // });
    super.initState();
    print(listCategories);

    fetchInfinitePosts(listCategories, keywords, 0);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchInfinitePosts(listCategories, keywords, 0);
      }
    });
  }

  final controller = ScrollController();
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  List<String> listCategories = [];
  String keywords = "";
  Future fetchInfinitePosts(
      List<String> categories, String keywords, int pages) async {
    if (isLoading) return;
    UserData userData =
        UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
    isLoading = true;
    const limit = 6;
    var categoriesString = "";
    if (categories.isNotEmpty) {
      categoriesString = "&Category=" + categories.join(",");
    }
    var search = "";
    if (keywords.isNotEmpty) {
      search = "&Search=" + keywords;
      print(search);
    }
    if (pages != 0) page = pages;
    print(listCategories);
    http.Response response = await http.get(
      Uri.parse(
          'https://reciapp.azurewebsites.net/api/category/post/page/$page?PageSize=$limit$categoriesString$search'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData.token}'
      },
    );
    var responseJson = json.decode(response.body);
    print(responseJson);
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      if (!mounted) return;
      setState(() {
        //final List jsonData = responseJson['data'];
        isLoading = false;
        if (pages != 0) page = pages;
        page++;
        if (responseJson['data'].length < limit) {
          print(responseJson['data'].length);
          hasMore = false;
        }
        if (pages == 1) _listReciepReviews.clear();
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
  Widget build(BuildContext context) {
    final getUserInfo = Provider.of<UserInfoProvider>(context, listen: false);
    print('At category page, token: ${getUserInfo.token}');
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
                          'Category',
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
          FilterCategory(
              fetchInfinitePosts: fetchInfinitePosts,
              listCategories: listCategories,
              keywords: keywords,
              dispose: dispose),
        ],
      ),
      bottomNavigationBar: Copyright(),
    );
  }
}

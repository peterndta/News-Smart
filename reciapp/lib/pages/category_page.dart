// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reciapp/components/bottom_bar.dart';
import '../components/filter_category.dart';
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
  @override
  void initState() {
    super.initState();
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
      List<String> categories, String keyword, int pages) async {
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
    if (keyword.isNotEmpty) {
      search = "&Search=" + keyword;
    }
    if (pages != 0) page = pages;
    print("Call: " +
        'https://reciapp.azurewebsites.net/api/category/post/page/$page?PageSize=$limit$categoriesString$search&Sort=$sortKey');
    http.Response response = await http.get(
      Uri.parse(
          'https://reciapp.azurewebsites.net/api/category/post/page/$page?PageSize=$limit$categoriesString$search&Sort=$sortKey'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ${userData.token}'
      },
    );
    if (response.statusCode == 200) {
      print('Sucessfully');
      var responseJson = json.decode(response.body);
      if (!mounted) return;
      setState(() {
        listCategories = categories;
        keywords = keyword;
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
    } else {
      print('Failed');
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
  List<String> listSort = ['Newest', 'Popularity', 'Oldest'];
  String sortKey = "Newest";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Category',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: EdgeInsets.only(right: 15),
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: sortKey,
                    onChanged: (String? newValue) {
                      setState(() {
                        sortKey = newValue!;
                        _listReciepReviews.clear();
                        hasMore = true;
                      });
                      fetchInfinitePosts(listCategories, keywords, 1);
                    },
                    items:
                        listSort.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: ListRecipeReview(
                  0.62, _listReciepReviews, controller, hasMore),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilterCategory(
            fetchInfinitePosts: fetchInfinitePosts,
          ),
        ],
      ),
      bottomNavigationBar: bottomMenuBar(context, 'category'),
    );
  }
}

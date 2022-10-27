import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reciapp/components/bottom_bar.dart';

import '../login_support/user_preference.dart';
import '../object/get_posts_homepage.dart';
import '../object/recipe_review.dart';
import 'package:http/http.dart' as http;

import '../object/user_info.dart';

class BookmarkPage extends StatefulWidget {
  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  TextEditingController keywords = TextEditingController();
  final controller = ScrollController();
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  Future fetchInfinitePosts() async {
    if (isLoading) return;
    UserData userData =
        UserData.fromJson(jsonDecode(UserPreferences.getUserInfo()));
    isLoading = true;
    const limit = 6;
    String searchKey =
        keywords.text.isNotEmpty ? '&Search=${keywords.text}' : '';
    print(
        'https://reciapp.azurewebsites.net/api/post/bookmark/page/$page?PageSize=$limit$searchKey');
    http.Response response = await http.get(
      Uri.parse(
          'https://reciapp.azurewebsites.net/api/post/bookmark/page/$page?PageSize=$limit$searchKey'),
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
  void initState() {
    super.initState();
    fetchInfinitePosts();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchInfinitePosts();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final List<GetPosts> _listReciepReviews = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('User Bookmark'),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.orange,
        titleTextStyle: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
      bottomNavigationBar: bottomMenuBar(context, 'bookmark'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Form(
                    key: _formKey,
                    child: TextFormField(
                        onFieldSubmitted: (value) {
                          isLoading = false;
                          hasMore = true;
                          page = 1;
                          setState(() {
                            _listReciepReviews.clear();
                          });
                          fetchInfinitePosts();
                        },
                        controller: keywords,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search Key',
                          alignLabelWithHint: false,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ))),
              ),
              ListRecipeReview(0.67, _listReciepReviews, controller, hasMore)
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../components/copyright.dart';
import '../login_support/user_preference.dart';
import '../object/get_posts_homepage.dart';
import 'package:http/http.dart' as http;

import '../object/recipe_review.dart';
import '../object/user_info.dart';

class UserRatingsPage extends StatefulWidget {
  final int userId;
  UserRatingsPage(this.userId, {super.key});

  @override
  State<UserRatingsPage> createState() => _UserRatingsPageState();
}

class _UserRatingsPageState extends State<UserRatingsPage> {
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
    http.Response response = await http.get(
      Uri.parse(
          'https://reciapp.azurewebsites.net/api/post/rating/page/$page?PageSize=$limit$searchKey'),
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

  int userId = 0;

  @override
  void initState() {
    super.initState();
    userId = widget.userId;
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
        title: const Text('User Ratings'),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.orange,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
      body: Padding(
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
                        if (_formKey.currentState!.validate()) {
                          isLoading = false;
                          hasMore = true;
                          page = 1;
                          setState(() {
                            _listReciepReviews.clear();
                          });
                          fetchInfinitePosts();
                        }
                      },
                      validator: (String? value) {
                        return (value == null || value.isEmpty)
                            ? 'Please enter'
                            : null;
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
            ListRecipeReview(0.72, _listReciepReviews, controller, hasMore)
          ],
        ),
      ),
      bottomNavigationBar: const Copyright(),
    );
  }
}

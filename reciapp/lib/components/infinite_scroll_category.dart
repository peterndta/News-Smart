import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/object/filter_provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../login_support/check_auth.dart';
import '../object/get_posts_homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InfiniteScrollCategory extends StatefulWidget {
  const InfiniteScrollCategory({Key? key}) : super(key: key);

  @override
  _InfiniteScrollCategoryState createState() => _InfiniteScrollCategoryState();
}

class _InfiniteScrollCategoryState extends State<InfiniteScrollCategory> {
  final controller = ScrollController();
  final List<GetPosts> posts = [];
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  String urlFilter = '';
  Future fetchInfinitePosts() async {
    if (isLoading) return;
    isLoading = true;
    const limit = 6;

    http.Response response = await http.get(
      Uri.parse(
          'https://reciapp.azurewebsites.net/api/category/post/page/$page?${urlFilter}PageSize=$limit'),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      setState(() {
        //final List jsonData = responseJson['data'];
        isLoading = false;
        page++;
        if (responseJson['data'].length < limit) {
          hasMore = false;
        }
        posts.addAll(responseJson['data']
            .map<GetPosts>((p) => GetPosts.fromJson(p))
            .toList());
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
        print(' more');
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getUserID = Provider.of<UserInfoProvider>(context, listen: false);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      //width: MediaQuery.of(context).size.width * 0.8,
      child: ListView.builder(
          controller: controller,
          itemCount: posts.length + 1,
          itemBuilder: (context, index) {
            if (index < posts.length) {
              final post = posts[index];
              return InkWell(
                //   onTap: () {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => /**foward đến recipe detail của recipe vừa bấm */));
                // },
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 15),
                    child: Row(
                      children: [
                        Image(
                          image: NetworkImage(post.imageUrl),
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.14,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  post.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              post.userId == getUserID.userID
                                  ? const Icon(
                                      Icons.bookmark,
                                      color: Colors.black,
                                    )
                                  : Container(),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  children: [
                                    SmoothStarRating(
                                      isReadOnly: true,
                                      size: 28,
                                      color: Colors.amber[600],
                                      rating: post.averageRating.toDouble(),
                                      borderColor: Colors.amber[600],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    post.description,
                                    style: const TextStyle(fontSize: 18),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: const Text(
                                        'By ',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        post.userName,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
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
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: hasMore
                      ? CircularProgressIndicator()
                      : Text('No more data to load'),
                ),
              );
            }
          }),
    );
  }
}

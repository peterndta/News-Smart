// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/pages/user_bookmark_page.dart';
import 'package:reciapp/pages/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_support/check_auth.dart';
import '../login_support/user_preference.dart';
import '../object/user_info.dart';

class HeadBar extends StatefulWidget {
  HeadBar({super.key});

  @override
  State<HeadBar> createState() => _HeadBarState();
}

class _HeadBarState extends State<HeadBar> {
  String? imageUrl;

  @override
  void initState() {
    loadData();
  }

  loadData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    UserData userData =
        UserData.fromJson(jsonDecode(data.getString('user') as String));
    setState(() {
      imageUrl = userData.imageURL;
    });
  }

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final getUserInfo = Provider.of<UserInfoProvider>(context, listen: false);
    return AppBar(
      elevation: 5,
      titleSpacing: -12,
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          width: MediaQuery.of(context).size.width * 0.94,
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _controller,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Find a recipe',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontStyle: FontStyle.italic),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: _controller.clear,
                      icon: Icon(
                        Icons.clear,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BookmarkPage()));
                  },
                  child: Icon(
                    size: 32,
                    Icons.bookmark,
                    color: Colors.white,
                  )),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              ClipOval(
                  child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          UserProfile()));
                },
                child: imageUrl == null?
                    Icon(Icons.person):
                    Image(
                  image: NetworkImage(imageUrl!),
                ),
              )),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            ],
          ),
        )
      ],
    );
  }
}

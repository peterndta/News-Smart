// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/pages/notification_page.dart';
import 'package:reciapp/pages/user_bookmark_page.dart';
import 'package:reciapp/pages/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_support/check_auth.dart';
import '../login_support/user_preference.dart';
import 'package:google_fonts/google_fonts.dart';
import '../object/user_info.dart';

class HeadBar extends StatefulWidget {
  HeadBar({required this.numOfNoti, super.key});
  int numOfNoti;

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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Home',
        style: GoogleFonts.satisfy(
          color: const Color.fromARGB(255, 59, 59, 61),
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 5,
      actions: [
        Badge(
          badgeContent: Text('${widget.numOfNoti}'),
          position: BadgePosition.topEnd(),
          padding: EdgeInsets.only(top: 17, bottom: 17, right: 10, left: 10),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
            icon: Icon(
              Icons.notifications,
              size: 40,
              color: const Color.fromARGB(255, 59, 59, 61),
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
          width: MediaQuery.of(context).size.width * 0.1,
          child: ClipOval(
              child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UserProfile()));
            },
            child: imageUrl == null
                ? Icon(Icons.person)
                : Image(
                    image: NetworkImage(imageUrl!),
                  ),
          )),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02)
      ],
    );
  }
}

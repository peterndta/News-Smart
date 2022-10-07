// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../pages/collection_page.dart';

class HeadBar extends StatefulWidget {
  const HeadBar({super.key});

  @override
  State<HeadBar> createState() => _HeadBarState();
}

class _HeadBarState extends State<HeadBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Colors.amber,

      elevation: 5,
      titleSpacing: -12,
      title: Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
          child: Image(image: AssetImage('assets/logo.png'))),
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),

      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CollectionPage()));
                  },
                  child: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ))
            ],
          ),
        )
      ],
    );
  }
}

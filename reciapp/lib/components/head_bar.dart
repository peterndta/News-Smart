// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HeadBar extends StatefulWidget {
  const HeadBar({super.key});

  @override
  State<HeadBar> createState() => _HeadBarState();
}

class _HeadBarState extends State<HeadBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      titleSpacing: -12,
      title: const Image(image: AssetImage('assets/logo.png')),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          width: 200,
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: TextStyle(color: Colors.white),
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
              TextButton(
                  onPressed: () {},
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

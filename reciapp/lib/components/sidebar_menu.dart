// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, color: Colors.white),
          Text('Home', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class RecipeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.book, color: Colors.white, size: 30),
          Text(
            'Recipe',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    );
  }
}

class CourseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.school, color: Colors.white),
              Text(
                'Course',
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.arrow_right,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange,
      width: 220,
      child: ListView(
        children: [
          HomeButton(),
          RecipeButton(),
          CourseButton(),
          ListTile(
            title: Text(
              'Category',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              'Methods',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

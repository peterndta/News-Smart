// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:reciapp/pages/category_page.dart';
import 'package:reciapp/pages/cooking_methods_page.dart';
import 'package:reciapp/pages/collection_page.dart';
import 'package:reciapp/pages/recipes_result_page.dart';
import 'package:reciapp/pages/user_profile.dart';
import 'package:reciapp/pages/home_page.dart';

import '../login_support/auth_service.dart';
import '../pages/login_page.dart';

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            Text('Home', style: TextStyle(color: Colors.white, fontSize: 25))
          ],
        ),
      ),
    );
  }
}

class RecipeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RecipesResult(),
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.menu_book,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            Text('Recipe', style: TextStyle(color: Colors.white, fontSize: 25)),
          ],
        ),
      ),
    );
  }
}

class CourseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CollectionPage(),
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.schedule,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            Text('Collection',
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryPage(),
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.soup_kitchen,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            Text('Category',
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ],
        ),
      ),
    );
  }
}

class MethodsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CookingMethodsPage(),
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.book,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            Text('Methods',
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ],
        ),
      ),
    );
  }
}

class AboutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.people,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Text('About',
                    style: TextStyle(color: Colors.white, fontSize: 25))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UserProfile(),
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Text('Profile',
                    style: TextStyle(color: Colors.white, fontSize: 25))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AuthService().signOut();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Text('Logout',
                    style: TextStyle(color: Colors.white, fontSize: 25))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SideBarMenu extends StatefulWidget {
  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange,
      width: MediaQuery.of(context).size.width * 0.55,
      child: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.white, width: 1),
              )),
              child: HomeButton()),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.white, width: 1),
              )),
              child: RecipeButton()),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              )),
              child: CourseButton()),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.white, width: 1),
              )),
              child: CategoryButton()),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.white, width: 1),
              )),
              child: MethodsButton()),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.white, width: 1),
              )),
              child: ProfileButton()),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.white, width: 1),
              )),
              child: AboutButton()),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.white, width: 1),
              )),
              child: LogoutButton()),
        ],
      ),
    );
  }
}

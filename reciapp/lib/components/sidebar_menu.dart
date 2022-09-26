// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

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
          Text('Home', style: TextStyle(color: Colors.white, fontSize: 25))
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
          Text('Recipe', style: TextStyle(color: Colors.white, fontSize: 25)),
        ],
      ),
    );
  }
}

class CourseButton extends StatefulWidget {
  @override
  State<CourseButton> createState() => _CourseButtonState();
}

class _CourseButtonState extends State<CourseButton> {
  List<String> CourseItem = ['Course', 'Dinner', 'Lunch', 'Breakfast'];
  String? selectedItem = 'Course';
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    //iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    focusColor: Colors.orange,
                    dropdownColor: Colors.orange,
                    value: selectedItem,
                    items: CourseItem.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      );
                    }).toList(),
                    onChanged: (item) => setState(() => selectedItem = item)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  List<String> CourseItem = ['Category', 'Beef', 'Egg', 'Pork', 'Chicken'];

  String? selectedItem = 'Category';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    iconEnabledColor: Colors.white,
                    focusColor: Colors.orange,
                    dropdownColor: Colors.orange,
                    value: selectedItem,
                    items: CourseItem.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      );
                    }).toList(),
                    onChanged: (item) => setState(() => selectedItem = item)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MethodsButton extends StatefulWidget {
  @override
  State<MethodsButton> createState() => _MethodsButtonState();
}

class _MethodsButtonState extends State<MethodsButton> {
  List<String> CourseItem = ['Methods', 'Chiên', 'Xào', 'Hấp', 'Luộc'];

  String? selectedItem = 'Methods';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    iconEnabledColor: Colors.white,
                    focusColor: Colors.orange,
                    dropdownColor: Colors.orange,
                    value: selectedItem,
                    items: CourseItem.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      );
                    }).toList(),
                    onChanged: (item) => setState(() => selectedItem = item)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AboutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              Text('About', style: TextStyle(color: Colors.white, fontSize: 25))
            ],
          )
        ],
      ),
    );
  }
}

class SideBarMenu extends StatefulWidget {
  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  List<String> CourseItem = ['Dinner', 'Lunch', 'Breakfast'];
  String? selectedItem = 'Dinner';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange,
      width: 220,
      child: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          HomeButton(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          RecipeButton(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CourseButton(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CategoryButton(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          MethodsButton(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          AboutButton(),
        ],
      ),
    );
  }
}

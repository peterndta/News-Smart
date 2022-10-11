// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:reciapp/pages/category_page.dart';
import 'package:reciapp/pages/cooking_methods_page.dart';
import 'package:reciapp/pages/collection_page.dart';
import 'package:reciapp/pages/recipes_result_page.dart';
import 'package:reciapp/pages/user_profile.dart';
import 'package:reciapp/pages/home_page.dart';

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

//class CourseButton extends StatefulWidget {
//   @override
//   State<CourseButton> createState() => _CourseButtonState();
// }
//class _CourseButtonState extends State<CourseButton> {
//   List<String> CourseItem = ['Course', 'Dinner', 'Lunch', 'Breakfast'];
//   String? selectedItem = 'Course';
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.schedule,
//             color: Colors.white,
//             size: 30,
//           ),
//           SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//           Row(
//             children: [
//               DropdownButtonHideUnderline(
//                 child: DropdownButton(
//                     //iconDisabledColor: Colors.white,
//                     iconEnabledColor: Colors.white,
//                     focusColor: Colors.orange,
//                     dropdownColor: Colors.orange,
//                     value: selectedItem,
//                     items: CourseItem.map((item) {
//                       return DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(
//                           item,
//                           style: TextStyle(color: Colors.white, fontSize: 25),
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (item) => setState(() => selectedItem = item)),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

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

// class CategoryButton extends StatefulWidget {
//   @override
//   State<CategoryButton> createState() => _CategoryButtonState();
// }
// class _CategoryButtonState extends State<CategoryButton> {
//   List<String> CourseItem = ['Category', 'Beef', 'Egg', 'Pork', 'Chicken'];
//   String? selectedItem = 'Category';
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.soup_kitchen,
//             color: Colors.white,
//             size: 30,
//           ),
//           SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//           Row(
//             children: [
//               DropdownButtonHideUnderline(
//                 child: DropdownButton(
//                     iconEnabledColor: Colors.white,
//                     focusColor: Colors.orange,
//                     dropdownColor: Colors.orange,
//                     value: selectedItem,
//                     items: CourseItem.map((item) {
//                       return DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(
//                           item,
//                           style: TextStyle(color: Colors.white, fontSize: 25),
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (item) => setState(() => selectedItem = item)),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
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

// class MethodsButton extends StatefulWidget {
//   @override
//   State<MethodsButton> createState() => _MethodsButtonState();
// }
// class _MethodsButtonState extends State<MethodsButton> {
//   List<String> CourseItem = ['Methods', 'Frizzle', 'Stir fry', 'Steam', 'Boil'];
//   String? selectedItem = 'Methods';
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 Icons.book,
//                 color: Colors.white,
//                 size: 30,
//               ),
//               SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//               DropdownButtonHideUnderline(
//                 child: DropdownButton(
//                     iconEnabledColor: Colors.white,
//                     focusColor: Colors.orange,
//                     dropdownColor: Colors.orange,
//                     value: selectedItem,
//                     items: CourseItem.map((item) {
//                       return DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(
//                           item,
//                           style: TextStyle(color: Colors.white, fontSize: 25),
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (item) => setState(() => selectedItem = item)),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

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
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => UserProfile(),
        // ));
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

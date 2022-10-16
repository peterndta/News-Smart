// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'food.dart';
import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
  final List<Food> foods = [
    Food(
      image:
          'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg',
      name: 'Lasagna',
      author: 'Tommy',
      content: 'short descriptionnnnnnnnnnnnnn ...',
      mail: 'tommy@',
    ),
    Food(
      image:
          'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg',
      name: 'Lasagna',
      author: 'Tommy',
      content: 'short description ...',
      mail: 'khuongvladimir2001@gmail.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: foods.length,
      itemBuilder: ((context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                    top: BorderSide(color: Colors.grey, width: 0.5))),
            child: Row(
              children: [
                Image(
                  image: NetworkImage(foods[index].image),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.14,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foods[index].name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      textAlign: TextAlign.end,
                    ),
                    foods[index].mail ==
                            FirebaseAuth.instance.currentUser!.email!
                        ? Icon(
                            Icons.bookmark,
                            color: Colors.black,
                          )
                        : Container(),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber[600]),
                        Icon(Icons.star, color: Colors.amber[600]),
                        Icon(Icons.star, color: Colors.amber[600]),
                        Icon(Icons.star, color: Colors.amber[600]),
                        Icon(Icons.star, color: Colors.amber[600]),
                      ],
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(foods[index].content)),
                    Row(
                      children: [
                        Text('by '),
                        Text(
                          foods[index].author,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

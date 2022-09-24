// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'components/copyright.dart';
import 'components/head_bar.dart';
import 'components/sidebar_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final foods = [
  //   {
  //     'image':
  //'https://pixabay.com/vi/photos/%c4%91%e1%bb%93i-n%c3%bai-ch%c3%a8-l%c3%a1-tr%c3%a0-%c4%91%e1%bb%93i-n%c3%bai-v%c6%b0%e1%bb%9dn-5112952/',
  //     'name': 'Lasagna',
  //     'author': 'Kevin',
  //     'content': 'short description ...',
  //   },
  //   {
  //     'image':
  //       'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixahive.com%2Fportfolio%2Faswinjm%2Fpage%2F11%2F&psig=AOvVaw2DQZxScQhkdDwAU16VU7Ku&ust=1664028705960000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJCb0pCMq_oCFQAAAAAdAAAAABAJ',
  //     'name': 'Ratatoulie',
  //     'author': 'Tommy',
  //     'content': 'short description ...',
  //   }
  // ]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: HeadBar(),
      ),
      body: Container(
        width: 600,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Latest Post',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Image(
                  image: NetworkImage(
                      'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg'),
                  width: 130,
                  height: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ratatoulie',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                    Text('short description'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('by '),
                        Text(
                          'Tommy',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Image(
                    image: NetworkImage(
                        'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg'),
                    width: 130,
                    height: 70,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ratatoulie',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                      Text('short description'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('by '),
                          Text(
                            'Tommy',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Recipes You\'ll Love',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Image(
                  image: NetworkImage(
                      'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg'),
                  width: 130,
                  height: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ratatoulie',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                    Text('short description'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('by '),
                        Text(
                          'Tommy',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Image(
                    image: NetworkImage(
                        'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg'),
                    width: 130,
                    height: 70,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ratatoulie',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                      Text('short description'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('by '),
                          Text(
                            'Tommy',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
      ),
      bottomNavigationBar: Copyright(),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../components/copyright.dart';
import '../components/head_bar.dart';
import '../components/sidebar_menu.dart';
import '../components/back_to_top_button.dart';
import '../object/food_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  @override
  void initState() {
    scrollController.addListener(() {
      //scroll listener
      double showoffset =
          10.0; //Back to top botton will show on scroll offset 10.0

      if (scrollController.offset > showoffset) {
        showbtn = true;
        setState(() {
          //update state
        });
      } else {
        showbtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: HeadBar(),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              SizedBox(
                //width: MediaQuery.of(context).size.width * 0.01,
                height: MediaQuery.of(context).size.height * 0.4,
                //height: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: NetworkImage(
                          'https://cdn.tgdd.vn/Files/2022/04/06/1424264/cach-lam-ratatouille-dep-mat-chuan-nhu-phim-hoat-hinh-cua-pixar-202204061506305893.jpg'),
                    ),
                    Text('Ratatoulie is the best',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 18)),
                    Text('If you hadn\'t watched the movie yet, watch it!')
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.8))),
                        child: Text(
                          'Latest Post',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    height: MediaQuery.of(context).size.height * 0.33,
                    child: FoodList(),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.8))),
                        child: Text(
                          'Recipes You\'ll Love',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    height: MediaQuery.of(context).size.height * 0.33,
                    child: FoodList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BackToTopButton(scrollController, showbtn),
      bottomNavigationBar: Copyright(),
    );
  }
}

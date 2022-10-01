// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../components/sidebar_menu.dart';
import '../components/back_to_top_button.dart';
import '../components/copyright.dart';
import '../components/head_bar.dart';
import '../object/food_list.dart';

class TodaySpecialPage extends StatefulWidget {
  const TodaySpecialPage({super.key});

  @override
  State<TodaySpecialPage> createState() => _TodaySpecialPageState();
}

class _TodaySpecialPageState extends State<TodaySpecialPage> {
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
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.06,
                      color: Color.fromARGB(255, 255, 231, 185),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          child: Text(
                            'Today\'s Special',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Inter',
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 0.8))),
                    child: Text(
                      'Most Popular',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              height: MediaQuery.of(context).size.height * 0.33,
              child: FoodList(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 0.8))),
                    child: Text(
                      'Newest Recipes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              height: MediaQuery.of(context).size.height * 0.33,
              child: FoodList(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 0.8))),
                    child: Text(
                      'More Recipes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              height: MediaQuery.of(context).size.height * 0.33,
              child: FoodList(),
            ),
          ],
        ),
      ),
      floatingActionButton: BackToTopButton(scrollController, showbtn),
      bottomNavigationBar: Copyright(),
    );
  }
}
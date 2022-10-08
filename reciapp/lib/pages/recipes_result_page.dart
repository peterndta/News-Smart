// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../components/filter_new_old_popular.dart';
import '../components/filter_recipe_result.dart';

import '../components/back_to_top_button.dart';
import '../components/copyright.dart';
import '../components/head_bar.dart';
import '../components/sidebar_menu.dart';
import '../object/food_list.dart';

class RecipesResult extends StatefulWidget {
  const RecipesResult({Key? key}) : super(key: key);

  @override
  _RecipesResultState createState() => _RecipesResultState();
}

class _RecipesResultState extends State<RecipesResult> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;
  bool isSelected = false;

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
            SizedBox(
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
                            'Recipes Result',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Inter',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 11),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [FilterNewOldPopular()])),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              height: MediaQuery.of(context).size.height * 0.33,
              child: FoodList(),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BackToTopButton(scrollController, showbtn),
          SizedBox(
            width: 5,
          ),
          FilterRecipeResult(isSelected)
        ],
      ),
      bottomNavigationBar: Copyright(),
    );
  }
}

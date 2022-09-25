// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'components/copyright.dart';
import 'components/head_bar.dart';
import 'components/sidebar_menu.dart';

class RecipeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: HeadBar(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Homemade Chicken Soup',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Ink(
                          decoration: BoxDecoration(
                            // border: Border.all(width: 1),
                            color: Colors.orange,
                          ),
                          child: InkWell(
                            //borderRadius: BorderRadius.circular(100.0),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.bookmark_border,
                                size: 25.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 1),
                        Ink(
                          decoration: BoxDecoration(
                            // border: Border.all(width: 1),
                            color: Color.fromARGB(255, 221, 218, 218),
                          ),
                          child: InkWell(
                            //borderRadius: BorderRadius.circular(100.0),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.star_outline,
                                size: 25.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Image.network(
                    'https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?resize=768,574'),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Preparing',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('20 minutes')
                      ],
                    ),
                    VerticalDivider(
                      width: 30,
                      thickness: 1,
                      // indent: 10,
                      // endIndent: 0,
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        Text(
                          'Processing',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('20 minutes')
                      ],
                    ),
                    const VerticalDivider(
                      width: 30,
                      thickness: 1,
                      // indent: 10,
                      // endIndent: 0,
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        Text(
                          'Cooking',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('20 minutes')
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.orange,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            child: Text(
                              'Preparing',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  WidgetSpan(
                                    child: Icon(Icons.people, size: 14),
                                  ),
                                  TextSpan(
                                      text: " Serving: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
                                  TextSpan(
                                      text: "4 people",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ))
                                ]))
                              ],
                            ),
                          )),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left:10),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ingredients:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: RichText(
                                  text: TextSpan(children: [
                                WidgetSpan(
                                  child: Icon(Icons.circle, size: 8),
                                  alignment: PlaceholderAlignment.middle
                                ),
                                TextSpan(
                                    text:
                                        " 1 (3 pound) whole chicken, 4 carrots, halved, 4 stalks celery, halved.",
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                              ])),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Tool needed:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: RichText(
                                  text: TextSpan(children: [
                                WidgetSpan(
                                  child: Icon(Icons.circle, size: 8),
                                  alignment: PlaceholderAlignment.middle
                                ),
                                TextSpan(
                                    text:
                                        " 1 (3 pound) whole chicken, 4 carrots, halved, 4 stalks celery, halved.",
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                              ])),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.orange,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Text(
                          'Processing',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          '1 (3 pound) whole chicken, 4 carrots, halved, 4 stalks celery, halved.'
                          '1 (3 pound) whole chicken, 4 carrots, halved, 4 stalks celery, halved.'
                          '1 (3 pound) whole chicken, 4 carrots, halved, 4 stalks celery, halved.'
                          '1 (3 pound) whole chicken, 4 carrots, halved, 4 stalks celery, halved.'
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
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

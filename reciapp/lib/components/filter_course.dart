// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'checkbox.dart';

class FilterCourse extends StatefulWidget {
  bool isSelected;

  FilterCourse(this.isSelected);

  @override
  State<FilterCourse> createState() => _FilterCourseState();
}

class _FilterCourseState extends State<FilterCourse> {
  var _controller = TextEditingController();
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.9,
                // color: Colors.amber,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.orange,
                            width: 3.0,
                          ),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.08,
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CloseButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.all(5),
                                side: BorderSide(
                                    width: 1.0, color: Colors.orange),
                                shape: RoundedRectangleBorder(),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                'Clear All',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 15),
                      // alignment: Alignment.bottomLeft,
                      height: MediaQuery.of(context).size.height * 0.17,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recipe or Keyword',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.023,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Keywords',
                                suffixIcon: IconButton(
                                  onPressed: _controller.clear,
                                  icon: Icon(Icons.clear),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.022,
                          ),
                          Divider(
                            color: Colors.orange,
                            height: 3,
                            thickness: 2,
                            indent: 50,
                            endIndent: 60,
                          ),
                        ],
                      ),
                      // color: Colors.yellow,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.24,
                      // color: Colors.yellow,
                      padding: EdgeInsets.only(top: 5, left: 15),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Course',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CheckBox(isSelected, 'Dinner'),
                              CheckBox(isSelected, 'Breakfast'),
                              CheckBox(isSelected, 'Lunch'),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.8,
                                    MediaQuery.of(context).size.height * 0.06),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Show Result',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            });
      },
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Colors.orange,
      child: Icon(Icons.tune),
    );
  }
}

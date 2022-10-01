// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../components/back_to_top_button.dart';
import '../components/copyright.dart';
import '../object/food_list.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final List<String> dropdownItems = ['Newest', 'Oldest'];
  String? selectedItem = 'Newest';
  final _textController = TextEditingController();
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          'Your Collection',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        controller: _textController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              _textController.clear();
                            },
                          ),
                          hintText: 'Search',
                          labelStyle: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.italic),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.13,
                  ),
                  DropdownButtonHideUnderline(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.5)),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: DropdownButton(
                            iconEnabledColor:
                                Color.fromARGB(255, 124, 112, 112),
                            focusColor: Colors.white,
                            value: selectedItem,
                            items: dropdownItems.map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 124, 112, 112),
                                      fontSize: 25),
                                ),
                              );
                            }).toList(),
                            onChanged: (item) =>
                                setState(() => selectedItem = item)),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text('Showing '),
                    Text(
                      '1 ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('to '),
                    Text(
                      '6 ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('of '),
                    Text(
                      '15',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.33,
                child: FoodList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.33,
                child: FoodList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.33,
                child: FoodList(),
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

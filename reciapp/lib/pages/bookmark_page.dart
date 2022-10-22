// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../components/back_to_top_button.dart';
import '../components/copyright.dart';
import '../object/food_list.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          'Saved recipes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
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
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Container()), //call api and return list here
            ],
          ),
        ),
      ),
      bottomNavigationBar: Copyright(),
    );
  }
}

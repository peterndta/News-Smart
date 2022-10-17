// ignore_for_file: prefer_const_constructors, prefer_final_fields, camel_case_types

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciapp/object/filter_provider.dart';
import '../object/category_item.dart';
import 'checkbox.dart';

class FilterCategory extends StatefulWidget {
  bool isSelected;

  FilterCategory(this.isSelected);

  @override
  State<FilterCategory> createState() => _FilterCategoryState();
}

class Category {
  int id;
  String type;
  Category(this.id, this.type);
}

class _FilterCategoryState extends State<FilterCategory> {
  TextEditingController searchController = TextEditingController();
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final List<String> selectedType = [];
    String categoryParams = '';
    String searchParam = '';
    final getParamsFilterCategory =
        Provider.of<CategoryProvider>(context, listen: false);
    getParamsFilterCategory.selectedCheckbox = selectedType;
    void submitData() {
      final searchResult = searchController.text;

      for (var i = 0; i < selectedType.length; i++) {
        // for (var i = 0;
        //     i < getParamsFilterCategory.selectedCheckbox.length;
        //     i++) {
        categoryParams += 'Category=${selectedType[i]}&';
      }
      selectedType.clear();
      if (searchResult.isEmpty) {
        searchParam = '';
      } else {
        searchParam = 'Search=$searchResult&';
      }
      getParamsFilterCategory.paramsFilterCategory =
          searchParam + categoryParams;

      print(getParamsFilterCategory.paramsFilterCategory);
      print('list item $selectedType');
      getParamsFilterCategory.paramsFilterCategory =
          ''; //sau khi filter show ra kết quả, set lại chuỗi rỗng
      //print(getParamsFilterCategory.paramsFilterCategory);
      Navigator.of(context).pop();
    }

    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
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
                              height:
                                  MediaQuery.of(context).size.height * 0.023,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextField(
                                controller: searchController,
                                onSubmitted: (_) => submitData(),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Keywords',
                                  suffixIcon: IconButton(
                                    onPressed: searchController.clear,
                                    icon: Icon(Icons.clear),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.022,
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
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 1.19,
                        padding: EdgeInsets.only(top: 5, left: 15),
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Categories',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.6,
                              height: MediaQuery.of(context).size.height * 1.02,
                              child: FutureBuilder(
                                  future: fetchCategories(),
                                  builder: ((context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Container();
                                    } else {
                                      return ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) => Row(
                                          children: [
                                            StatefulBuilder(
                                              builder: (context, _setState) =>
                                                  Checkbox(
                                                side: BorderSide(
                                                    color: Colors.orange),
                                                value: isSelected,
                                                onChanged: (bool? value) {
                                                  _setState(() {
                                                    isSelected = value!;
                                                    if (isSelected == true) {
                                                      selectedType.add(snapshot
                                                          .data[index].type);
                                                    } else {
                                                      selectedType.remove(
                                                          snapshot.data[index]
                                                              .type);
                                                    }
                                                    //print(selectedType);
                                                  });
                                                },
                                              ),
                                            ),
                                            Text(
                                              snapshot.data[index].type,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  })),
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.8,
                                      MediaQuery.of(context).size.height *
                                          0.06),
                                ),
                                onPressed: () {
                                  submitData();
                                },
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

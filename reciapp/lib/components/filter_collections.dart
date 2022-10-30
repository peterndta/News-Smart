// ignore_for_file: prefer_const_constructors, prefer_final_fields, camel_case_types

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../object/collection_item.dart';
import 'checkbox.dart';

class FilterCollections extends StatefulWidget {
  Function fetchInfinitePosts;
  String collectionName;
  List<String> datas;

  FilterCollections(
      {required this.fetchInfinitePosts,
      required this.collectionName,
      required this.datas});

  @override
  State<FilterCollections> createState() => _FilterCollectionsState();
}

class _FilterCollectionsState extends State<FilterCollections> {

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.06,
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(builder: (BuildContext context,
                    StateSetter setModalState /*You can rename this!*/) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
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
                                    onPressed: () {
                                      setModalState(() {
                                        searchController.clear();
                                      });
                                    },
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
                            padding:
                                EdgeInsets.only(top: 15, left: 15, right: 15),
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
                                  height: MediaQuery.of(context).size.height *
                                      0.023,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: TextField(
                                    //autofocus: true,
                                    controller: searchController,

                                    //onSubmitted:
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
                                  height: MediaQuery.of(context).size.height *
                                      0.022,
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
                            padding: EdgeInsets.only(top: 5, left: 15),
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Collections',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: DropdownButtonFormField2(
                                    isExpanded: true,
                                    items: widget.datas
                                        .map(
                                            (item) => DropdownMenuItem<dynamic>(
                                                  value: item,
                                                  child: Text(
                                                    '  $item',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                        .toList(),
                                    value: widget.collectionName,
                                    onChanged: (value) {
                                      setState(() {
                                        widget.collectionName = value!;
                                        print(widget.collectionName);
                                      });
                                    },
                                    buttonHeight:
                                        MediaQuery.of(context).size.height *
                                            0.07,
                                    buttonDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.black26,
                                        ),
                                        color: Colors.white),
                                    itemHeight: 40,
                                    buttonElevation: 2,
                                    itemPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    dropdownMaxHeight: 200,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    dropdownElevation: 8,
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: true,
                                  ),
                                ),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                          MediaQuery.of(context).size.height *
                                              0.06),
                                    ),
                                    onPressed: () {
                                      widget
                                          .fetchInfinitePosts(
                                              widget.collectionName,
                                              searchController.text,
                                              1)
                                          .whenComplete(() {
                                        Navigator.pop(context);
                                      });
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
              });
        },
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Row(
            children: const [
              Icon(Icons.tune, color: Colors.white),
              Text(
                'Filter',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}

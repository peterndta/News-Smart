import 'package:flutter/material.dart';

class FilterNewOldPopular extends StatefulWidget {
  const FilterNewOldPopular({Key? key}) : super(key: key);

  @override
  _FilterNewOldPopularState createState() => _FilterNewOldPopularState();
}

class _FilterNewOldPopularState extends State<FilterNewOldPopular> {
  final List<String> dropdownItems = ['Newest', 'Oldest', 'Popularity'];
  String? selectedItem = 'Newest';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: DropdownButton(
              iconEnabledColor: const Color.fromARGB(255, 124, 112, 112),
              focusColor: Colors.white,
              value: selectedItem,
              items: dropdownItems.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 124, 112, 112),
                        fontSize: 25),
                  ),
                );
              }).toList(),
              onChanged: (item) => setState(() => selectedItem = item)),
        ),
      ),
    );
  }
}

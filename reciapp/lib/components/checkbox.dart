import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  bool isChecked;
  String title;

  CheckBox(this.isChecked, this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatefulBuilder(
            builder: (context, _setState) => Checkbox(
                side: BorderSide(color: Colors.orange),
                value: isChecked,
                onChanged: (bool? value) {
                  _setState(() {
                    isChecked = value!;
                  });
                },
              )),
        Text(
          title,
          style: TextStyle(
            fontSize: 18
          ),
        ),
      ],
    );
  }
}
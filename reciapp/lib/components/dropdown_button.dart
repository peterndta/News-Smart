import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownOneChoiceButton extends StatefulWidget {
  String text;
  List<dynamic> datas;
  dynamic data;
  double? sizeText;
  FontWeight? fontWeight;

  DropdownOneChoiceButton(
      {super.key,
      required this.text,
      required this.datas,
      required this.data,
      this.sizeText,
      this.fontWeight});

  @override
  State<DropdownOneChoiceButton> createState() =>
      _DropdownOneChoiceButtonState();
}

class _DropdownOneChoiceButtonState extends State<DropdownOneChoiceButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text.rich(
            TextSpan(
              children: <InlineSpan>[
                WidgetSpan(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        fontWeight: widget.fontWeight ?? FontWeight.bold,
                        fontSize: widget.sizeText ?? 20),
                  ),
                ),
                WidgetSpan(
                  child: Text(
                    '*',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: widget.fontWeight ?? FontWeight.bold,
                        fontSize: widget.sizeText ?? 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.006,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2(
            validator: (value) {
              if (value == null) {
                return 'Please select ${widget.text}.';
              }
              return null;
            },
            isExpanded: true,
            hint: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                '  Select ${widget.text}',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            items: widget.datas
                .map((item) => DropdownMenuItem<dynamic>(
                      value: item,
                      child: Text(
                        '  $item',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: widget.data,
            onChanged: (value) {
              setState(() {
                widget.data = value;
                print(widget.data);
              });
            },
            buttonHeight: MediaQuery.of(context).size.height * 0.05,
            buttonWidth: MediaQuery.of(context).size.width,
            buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.white),
            itemHeight: 40,
            buttonElevation: 2,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
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
      ],
    );
  }
}

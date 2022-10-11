import 'package:flutter/material.dart';

class TextBoxForm extends StatefulWidget {
  String text;
  int? maxLines;
  TextEditingController controller;

  TextBoxForm({required this.text, required this.controller, this.maxLines});

  @override
  State<TextBoxForm> createState() => _TextBoxFormState();
}

class _TextBoxFormState extends State<TextBoxForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (String? value) {
          return (value == null || value.isEmpty)
              ? 'Please enter ${widget.text}'
              : null;
        },
        maxLines: widget.maxLines ?? 7,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: '${widget.text} of dish',
          alignLabelWithHint: true,
          label: Text.rich(
            TextSpan(
              children: <InlineSpan>[
                WidgetSpan(
                  child: Text(
                    widget.text,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const WidgetSpan(
                  child: Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ));
  }
}

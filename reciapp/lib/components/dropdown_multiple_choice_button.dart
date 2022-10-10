import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:reciapp/object/category_item.dart';

class DropDowmMultipleChoice extends StatefulWidget {
  String text;
  List<CategoryItem> categories;
  List<CategoryItem> selectedCategorys;

  DropDowmMultipleChoice(
      {super.key,
      required this.text,
      required this.categories,
      required this.selectedCategorys});

  @override
  State<DropDowmMultipleChoice> createState() => _DropDowmMultiplrChoiceState();
}

class _DropDowmMultiplrChoiceState extends State<DropDowmMultipleChoice> {
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
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const WidgetSpan(
                  child: Text(
                    '*',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
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
                return 'Please select category.';
              }
              return null;
            },
            isExpanded: true,
            hint: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                '  Select Categories',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            items: widget.categories.map((item) {
              return DropdownMenuItem<CategoryItem>(
                value: item,
                //disable default onTap to avoid closing menu when selecting an item
                enabled: false,
                child: StatefulBuilder(
                  builder: (context, menuSetState) {
                    final _isSelected = widget.selectedCategorys.contains(item);
                    return InkWell(
                      onTap: () {
                        _isSelected
                            ? widget.selectedCategorys.remove(item)
                            : widget.selectedCategorys.add(item);
                        //This rebuilds the StatefulWidget to update the button's text
                        setState(() {});
                        //This rebuilds the dropdownMenu Widget to update the check mark
                        menuSetState(() {});
                      },
                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            _isSelected
                                ? const Icon(Icons.check_box_outlined)
                                : const Icon(Icons.check_box_outline_blank),
                            const SizedBox(width: 16),
                            Text(
                              '  $item',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
            //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
            value: widget.selectedCategorys.isEmpty
                ? null
                : widget.selectedCategorys.last,
            onChanged: (value) {},
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
            selectedItemBuilder: (context) {
              return widget.categories.map(
                (item) {
                  return Container(
                    alignment: AlignmentDirectional.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.selectedCategorys.join(', '),
                      style: const TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  );
                },
              ).toList();
            },
          ),
        ),
      ],
    );
  }
}

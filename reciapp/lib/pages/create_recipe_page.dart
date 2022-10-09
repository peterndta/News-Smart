import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:reciapp/components/copyright.dart';

class CreateRecipePage extends StatefulWidget {
  String? title;
  String? description;
  String? tools;
  String? ingredients;
  String? processing;
  String? cooking;
  String? linkVideo;
  CreateRecipePage({super.key});

  CreateRecipePage.fromForm({
    super.key,
    required this.title,
    required this.description,
    required this.tools,
    required this.ingredients,
    required this.processing,
    required this.cooking,
    required this.linkVideo,
  });

  @override
  State<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {
  File? image;
  UploadTask? uploadTask;
  bool checkImage = true;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController tools = TextEditingController();
  TextEditingController ingredients = TextEditingController();
  TextEditingController processing = TextEditingController();
  TextEditingController cooking = TextEditingController();
  TextEditingController linkVideo = TextEditingController();
  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.title);
    description = TextEditingController(text: widget.description);
    tools = TextEditingController(text: widget.tools);
    ingredients = TextEditingController(text: widget.ingredients);
    processing = TextEditingController(text: widget.processing);
    cooking = TextEditingController(text: widget.cooking);
    linkVideo = TextEditingController(text: widget.linkVideo);
  }

  final List<String> category = [
    'Beef',
    'Egg',
    'Chicken',
    'Seafood',
    'Pork',
  ];
  List<String> selectedCategorys = [];

  final List<String> methods = [
    'Boil',
    'Fry',
    'Roast',
  ];
  String? selectedMethod;
  final List<String> uses = [
    'Health',
    'For Full',
    'Diet',
  ];
  String? selectedUse;
  final List<String> continents = [
    'Asia',
    'Africa',
    'Antarctica',
    'Australia',
    'Europe',
    'North America',
  ];
  String? selectedContinent;
  final List<int> serving = [2, 4, 6, 8, 10];
  int? selectedServe;
  final List<int> times = [10, 20, 30, 40, 60, 80, 100, 120, 140, 160, 180];
  int? selectedTimeCooking;
  int? selectedTimeProcessing;
  int? selectedTimePreparing;
  final _formKey = GlobalKey<FormState>();

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = await saveImagePermantly(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Fail to pick image: $e');
    }
  }

  Future<File> saveImagePermantly(String path) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(path);
    final image = File('${directory.path}/$name');
    return File(path).copy(image.path);
  }

  Future<String> uploadFile() async {
    final pathUpload = 'images/${image!.path}';
    final ref = FirebaseStorage.instance.ref().child(pathUpload);

    uploadTask = ref.putFile(image!);
    final snapshot = await uploadTask!.whenComplete(() {});

    final imageUrl = await snapshot.ref.getDownloadURL();
    print(imageUrl);
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateRecipePage'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 15),
                  alignment: Alignment.center,
                  child: const Text(
                    'CREATE RECIPE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.orange),
                  ),
                ),
                TextFormField(
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Please enter name of dish'
                          : null;
                    },
                    controller: title,
                    decoration: const InputDecoration(
                      hintText: 'Name of dish',
                      label: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Title',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextFormField(
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Please enter description of dish'
                          : null;
                    },
                    maxLines: 7,
                    controller: description,
                    decoration: const InputDecoration(
                      hintText: 'Description of dish',
                      alignLabelWithHint: true,
                      label: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Description',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                image != null
                    ? Image.file(
                        image!,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.2,
                        color: Colors.grey,
                        child: const Text(
                          'Poster',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.orange, width: 2),
                  ),
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 20,
                  ),
                  label: const Text('Upload Photo',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  onPressed: () => pickImage(ImageSource.gallery),
                ),
                !checkImage
                    ? const Text(
                        'Please upload image!',
                        style: TextStyle(color: Colors.red),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Text(
                            'Category',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        WidgetSpan(
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
                    items: category.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        //disable default onTap to avoid closing menu when selecting an item
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            final _isSelected =
                                selectedCategorys.contains(item);
                            return InkWell(
                              onTap: () {
                                _isSelected
                                    ? selectedCategorys.remove(item)
                                    : selectedCategorys.add(item);
                                //This rebuilds the StatefulWidget to update the button's text
                                setState(() {});
                                //This rebuilds the dropdownMenu Widget to update the check mark
                                menuSetState(() {});
                              },
                              child: Container(
                                height: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    _isSelected
                                        ? const Icon(Icons.check_box_outlined)
                                        : const Icon(
                                            Icons.check_box_outline_blank),
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
                    value: selectedCategorys.isEmpty
                        ? null
                        : selectedCategorys.last,
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
                      return category.map(
                        (item) {
                          return Container(
                            alignment: AlignmentDirectional.center,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              selectedCategorys.join(', '),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Text(
                            'Method',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        WidgetSpan(
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
                        return 'Please select method.';
                      }
                      return null;
                    },
                    isExpanded: true,
                    hint: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        '  Select Method',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                    items: methods
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                '  $item',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedMethod = value as String;
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Text(
                            'Uses',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        WidgetSpan(
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
                        return 'Please select use.';
                      }
                      return null;
                    },
                    isExpanded: true,
                    hint: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        '  Select use',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                    items: uses
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                '  $item',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedUse,
                    onChanged: (value) {
                      setState(() {
                        selectedUse = value as String;
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Text(
                            'Continent',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        WidgetSpan(
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
                        return 'Please select continent.';
                      }
                      return null;
                    },
                    isExpanded: true,
                    hint: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        '  Select Continent',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                    items: continents
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                '  $item',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedContinent,
                    onChanged: (value) {
                      setState(() {
                        selectedContinent = value as String;
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Text(
                            'Serving',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        WidgetSpan(
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
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          validator: (value) {
                            if (value == null) {
                              return 'Please Select serve';
                            }
                            return null;
                          },
                          isExpanded: true,
                          hint: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              '  Select',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ),
                          items: serving
                              .map((item) => DropdownMenuItem<int>(
                                    value: item,
                                    child: Text(
                                      '  $item',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedServe,
                          onChanged: (value) {
                            setState(() {
                              selectedServe = value as int;
                            });
                          },
                          buttonHeight:
                              MediaQuery.of(context).size.height * 0.05,
                          buttonWidth: MediaQuery.of(context).size.width * 0.25,
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white),
                          itemHeight: 40,
                          buttonElevation: 2,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
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
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    const Text(
                      'Number of person for serving',
                      style: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Direction',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.035,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        border: Border.all(color: Colors.orange)),
                    child: const Center(
                      child: Text(
                        'Step 1: Preparation',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Time Preparing',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                '*',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          validator: (value) {
                            if (value == null) {
                              return 'Please Select time';
                            }
                            return null;
                          },
                          isExpanded: true,
                          hint: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              '  Select Time',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ),
                          items: times
                              .map((item) => DropdownMenuItem<int>(
                                    value: item,
                                    child: Text(
                                      '  $item minutes',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedTimePreparing,
                          onChanged: (value) {
                            setState(() {
                              selectedTimePreparing = value as int;
                            });
                          },
                          buttonHeight:
                              MediaQuery.of(context).size.height * 0.04,
                          buttonWidth: MediaQuery.of(context).size.width * 0.4,
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white),
                          itemHeight: 40,
                          buttonElevation: 2,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
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
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Please enter tool of dish'
                          : null;
                    },
                    maxLines: 5,
                    controller: tools,
                    decoration: const InputDecoration(
                      hintText: 'Enter Tool Needed',
                      alignLabelWithHint: true,
                      label: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Tool Needed',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Please enter ingredient of dish'
                          : null;
                    },
                    maxLines: 5,
                    controller: ingredients,
                    decoration: const InputDecoration(
                      hintText: 'Enter Ingredients Needed',
                      alignLabelWithHint: true,
                      label: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Ingredients Needed',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.035,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        border: Border.all(color: Colors.orange)),
                    child: const Center(
                      child: Text(
                        'Step 2: Processing',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Time Processing',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                '*',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          validator: (value) {
                            if (value == null) {
                              return 'Please Select time';
                            }
                            return null;
                          },
                          isExpanded: true,
                          hint: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              '  Select Time',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ),
                          items: times
                              .map((item) => DropdownMenuItem<int>(
                                    value: item,
                                    child: Text(
                                      '  $item minutes',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedTimeProcessing,
                          onChanged: (value) {
                            setState(() {
                              selectedTimeProcessing = value as int;
                            });
                          },
                          buttonHeight:
                              MediaQuery.of(context).size.height * 0.04,
                          buttonWidth: MediaQuery.of(context).size.width * 0.4,
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white),
                          itemHeight: 40,
                          buttonElevation: 2,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
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
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Please enter details'
                          : null;
                    },
                    maxLines: 5,
                    controller: processing,
                    decoration: const InputDecoration(
                      hintText: 'Enter Details',
                      alignLabelWithHint: true,
                      label: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Details',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.035,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        border: Border.all(color: Colors.orange)),
                    child: const Center(
                      child: Text(
                        'Step 3: Cooking     ',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          height: 1,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Time Cooking',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                '*',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          validator: (value) {
                            if (value == null) {
                              return 'Please Select time';
                            }
                            return null;
                          },
                          isExpanded: true,
                          hint: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              '  Select Time',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ),
                          items: times
                              .map((item) => DropdownMenuItem<int>(
                                    value: item,
                                    child: Text(
                                      '  $item minutes',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedTimeCooking,
                          onChanged: (value) {
                            setState(() {
                              selectedTimeCooking = value as int;
                            });
                          },
                          buttonHeight:
                              MediaQuery.of(context).size.height * 0.04,
                          buttonWidth: MediaQuery.of(context).size.width * 0.4,
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white),
                          itemHeight: 40,
                          buttonElevation: 2,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
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
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Please enter details'
                          : null;
                    },
                    maxLines: 5,
                    controller: cooking,
                    decoration: const InputDecoration(
                      hintText: 'Enter Details',
                      alignLabelWithHint: true,
                      label: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Details',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextFormField(
                    validator: (String? value) {
                      final youtubeValidator = RegExp(
                          r'^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$');
                      return (value == null ||
                              value.isEmpty ||
                              !youtubeValidator.hasMatch(value))
                          ? 'Please enter valid link Video'
                          : null;
                    },
                    controller: linkVideo,
                    decoration: const InputDecoration(
                      hintText: 'Enter Link',
                      label: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Link Video',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('SUBMIT',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    // final url = uploadFile();
                    // print(url);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Copyright()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

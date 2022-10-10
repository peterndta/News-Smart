// ignore_for_file: depend_on_referenced_packages
import 'dart:ffi';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:reciapp/components/copyright.dart';
import 'package:reciapp/components/dropdown_button.dart';
import '../components/dropdown_multiple_choice_button.dart';
import '../object/category_item.dart';
import '../object/method_item.dart';
import '../object/region_item.dart';
import '../object/use_item.dart';

class SelectedItem {
  dynamic data;

  SelectedItem(this.data);
}

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
  Future getAllData() async {
    var categories = await fetchCategories();
    var methods = await fetchMethods();
    var uses = await fetchUses();
    var regions = await fetchRegions();
    setState(() {
      this.categories = categories;
      this.methods = methods;
      this.uses = uses;
      this.regions = regions;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllData();
    title = TextEditingController(text: widget.title);
    description = TextEditingController(text: widget.description);
    tools = TextEditingController(text: widget.tools);
    ingredients = TextEditingController(text: widget.ingredients);
    processing = TextEditingController(text: widget.processing);
    cooking = TextEditingController(text: widget.cooking);
    linkVideo = TextEditingController(text: widget.linkVideo);
  }

  List<CategoryItem> categories = [];
  List<CategoryItem> selectedCategorys = [];

  List<MethodItem> methods = [];
  MethodItem? selectedMethod;

  List<UseItem> uses = [];
  UseItem? selectedUse;
  List<RegionItem> regions = [];
  RegionItem? selectedRegion;

  final List<int> serving = [2, 4, 6, 8, 10];
  SelectedItem? selectedServe;
  final List<int> times = [10, 20, 30, 40, 60, 80, 100, 120, 140, 160, 180];
  SelectedItem? selectedTimeCooking;
  SelectedItem? selectedTimeProcessing;
  SelectedItem? selectedTimePreparing;

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
                //
                DropDowmMultipleChoice(
                    text: 'Category',
                    categories: categories,
                    selectedCategorys: selectedCategorys),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                DropdownOneChoiceButton(
                    text: 'Method', datas: methods, data: selectedMethod),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                DropdownOneChoiceButton(
                    text: 'Use', datas: uses, data: selectedUse),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                DropdownOneChoiceButton(
                    text: 'Region', datas: regions, data: selectedRegion),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                DropdownOneChoiceButton(
                    text: 'Serving', datas: serving, data: selectedServe),
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
                DropdownOneChoiceButton(
                    text: 'Time Preparing',
                    datas: times,
                    data: selectedTimePreparing,
                    sizeText: 15,
                    fontWeight: FontWeight.normal),
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
                DropdownOneChoiceButton(
                    text: 'Time Processing',
                    datas: times,
                    data: selectedTimeProcessing,
                    sizeText: 15,
                    fontWeight: FontWeight.normal),
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
                DropdownOneChoiceButton(
                    text: 'Time Cooking',
                    datas: times,
                    data: selectedTimeCooking,
                    sizeText: 15,
                    fontWeight: FontWeight.normal),
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
                    for (var item in selectedCategorys) {
                      print(item.id);
                    }
                    print(selectedTimeCooking?.data);
                    print(selectedRegion);
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

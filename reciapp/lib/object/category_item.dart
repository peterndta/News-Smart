// To parse this JSON data, do
//
//     final categoryItem = categoryItemFromJson(jsonString);
import 'package:http/http.dart' as http;
import 'dart:convert';

CategoryItem categoryItemFromJson(String str) =>
    CategoryItem.fromJson(json.decode(str));

String categoryItemToJson(CategoryItem data) => json.encode(data.toJson());

Future fetchCategories() async {
  http.Response response = await http.get(
    Uri.parse('https://reciapp.azurewebsites.net/api/categories'),
    headers: {
      "content-type": "application/json",
      "accept": "application/json",
    },
  );
  var responseJson = json.decode(response.body);
  return (responseJson['data'] as List)
      .map((p) => CategoryItem.fromJson(p))
      .toList();
}

class CategoryItem {
  CategoryItem({
    required this.id,
    required this.type,
  });

  int id;
  String type;

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
  @override
  String toString() {
    // TODO: implement toString
    return type;
  }
}

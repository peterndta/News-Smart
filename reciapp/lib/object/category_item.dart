// To parse this JSON data, do
//
//     final categoryItem = categoryItemFromJson(jsonString);

import 'dart:convert';

CategoryItem categoryItemFromJson(String str) =>
    CategoryItem.fromJson(json.decode(str));

String categoryItemToJson(CategoryItem data) => json.encode(data.toJson());

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
}

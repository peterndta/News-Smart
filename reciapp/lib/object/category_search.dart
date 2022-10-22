// To parse this JSON data, do
//
//     final CategorySearchItem = CategorySearchItemFromJson(jsonString);
import 'dart:convert';

CategorySearchItem CategorySearchItemFromJson(String str) =>
    CategorySearchItem.fromJson(json.decode(str));

String CategorySearchItemToJson(CategorySearchItem data) =>
    json.encode(data.toJson());

class CategorySearchItem {
  CategorySearchItem({
    required this.keywords,
    required this.categories,
  });

  String keywords;
  List<String> categories;

  factory CategorySearchItem.fromJson(Map<String, dynamic> json) =>
      CategorySearchItem(
        keywords: json["keywords"],
        categories: List<String>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "keywords": keywords,
        "categories": List<dynamic>.from(categories.map((x) => x)),
      };
}

// To parse this JSON data, do
//
//     final PostSearchItem = PostSearchItemFromJson(jsonString);
import 'dart:convert';


PostSearchItem PostSearchItemFromJson(String str) =>
    PostSearchItem.fromJson(json.decode(str));

String PostSearchItemToJson(PostSearchItem data) => json.encode(data.toJson());


class PostSearchItem {
  PostSearchItem({
    required this.keywords,
    required this.categories,
    required this.continents
  });

  String keywords;
  List<String> categories;
  List<String> continents;

  factory PostSearchItem.fromJson(Map<String, dynamic> json) => PostSearchItem(
        keywords: json["keywords"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        continents: List<String>.from(json["continents"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "keywords": keywords,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "continents": List<dynamic>.from(continents.map((x) => x)),
      };
}

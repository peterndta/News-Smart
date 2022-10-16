// To parse required this JSON data, do
//
//     final postItem = postItemFromJson(jsonString);

import 'dart:convert';

PostItem postItemFromJson(String str) => PostItem.fromJson(json.decode(str));

String postItemToJson(PostItem data) => json.encode(data.toJson());

class PostItem {
  PostItem({
    required this.id,
    required this.name,
    required this.cookingMethodId,
    required this.recipeRegionId,
    required this.imageUrl,
    required this.videoUrl,
    required this.usesId,
    required this.description,
    required this.categoriesId,
    required this.ingredient,
    required this.processing,
    required this.cooking,
    required this.tool,
    required this.processingTime,
    required this.cookingTime,
    required this.preparingTime,
    required this.serving,
  });

  int id;
  String name;
  int cookingMethodId;
  int recipeRegionId;
  String imageUrl;
  String videoUrl;
  int usesId;
  String description;
  List<int> categoriesId;
  String ingredient;
  String processing;
  String cooking;
  String tool;
  int processingTime;
  int cookingTime;
  int preparingTime;
  int serving;

  factory PostItem.fromJson(Map<String, dynamic> json) => PostItem(
        id: json["id"],
        name: json["name"],
        cookingMethodId: json["cookingMethodId"],
        recipeRegionId: json["recipeRegionId"],
        imageUrl: json["imageUrl"],
        videoUrl: json["videoUrl"],
        usesId: json["usesId"],
        description: json["description"],
        categoriesId: List<int>.from(json["categoriesId"].map((x) => x)),
        ingredient: json["ingredient"],
        processing: json["processing"],
        cooking: json["cooking"],
        tool: json["tool"],
        processingTime: json["processingTime"],
        cookingTime: json["cookingTime"],
        preparingTime: json["preparingTime"],
        serving: json["serving"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cookingMethodId": cookingMethodId,
        "recipeRegionId": recipeRegionId,
        "imageUrl": imageUrl,
        "videoUrl": videoUrl,
        "usesId": usesId,
        "description": description,
        "categoriesId": List<dynamic>.from(categoriesId.map((x) => x)),
        "ingredient": ingredient,
        "processing": processing,
        "cooking": cooking,
        "tool": tool,
        "processingTime": processingTime,
        "cookingTime": cookingTime,
        "preparingTime": preparingTime,
        "serving": serving,
      };
}

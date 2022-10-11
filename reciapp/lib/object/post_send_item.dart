// To parse this JSON data, do
//
//     final postSendItem = postSendItemFromJson(jsonString);
import 'dart:convert';
import 'package:http/http.dart' as http;

PostSendItem postSendItemFromJson(String str) =>
    PostSendItem.fromJson(json.decode(str));

String postSendItemToJson(PostSendItem data) => json.encode(data.toJson());

Future submitData(PostSendItem post) async {
  var response = await http.post(
    Uri.parse('https://reciapp.azurewebsites.net/api/user/${post.usesId}/post'),
    body: postSendItemToJson(post),
    headers: {
      "content-type": "application/json",
      "accept": "application/json",
    },
  );
  var data = response.body;

  if (response.statusCode == 200) {
    String responseString = response.body;
    print(responseString);
  } else {
    print(data);
  }
}

class PostSendItem {
  PostSendItem({
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

  factory PostSendItem.fromJson(Map<String, dynamic> json) => PostSendItem(
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

// To parse this JSON data, do
//
//     final getPosts = getPostsFromJson(jsonString);
import 'package:http/http.dart' as http;

import 'dart:convert';

GetPosts getPostsFromJson(String str) => GetPosts.fromJson(json.decode(str));

String getPostsToJson(GetPosts data) => json.encode(data.toJson());

Future fetchPosts() async {
  http.Response response = await http.get(
    Uri.parse('https://reciapp.azurewebsites.net/api/post/page/1?PageSize=6'),
    headers: {
      "content-type": "application/json",
      "accept": "application/json",
    },
  );
  var responseJson = json.decode(response.body);
  return (responseJson['data'] as List)
      .map((p) => GetPosts.fromJson(p))
      .toList();
}

class GetPosts {
  GetPosts({
    required this.id,
    required this.name,
    required this.createDate,
    required this.updateDate,
    required this.cookingMethodId,
    required this.method,
    required this.recipeRegionId,
    required this.description,
    required this.continents,
    required this.userId,
    required this.status,
    required this.imageUrl,
    required this.videoUrl,
    required this.listCategories,
    required this.userName,
    required this.usesId,
    required this.averageRating,
    required this.rating,
    required this.bookmark,
    required this.isReport,
  });

  String id;
  String name;
  DateTime createDate;
  DateTime updateDate;
  int cookingMethodId;
  String method;
  int recipeRegionId;
  String description;
  String continents;
  int userId;
  int status;
  String imageUrl;
  String videoUrl;
  List<ListCategory> listCategories;
  String userName;
  int usesId;
  int averageRating;
  int rating;
  bool bookmark;
  bool isReport;

  factory GetPosts.fromJson(Map<String, dynamic> json) => GetPosts(
        id: json["id"],
        name: json["name"],
        createDate: DateTime.parse(json["createDate"]),
        updateDate: DateTime.parse(json["updateDate"]),
        cookingMethodId: json["cookingMethodId"],
        method: json["method"],
        recipeRegionId: json["recipeRegionId"],
        description: json["description"],
        continents: json["continents"],
        userId: json["userId"],
        status: json["status"],
        imageUrl: json["imageUrl"],
        videoUrl: json["videoUrl"],
        listCategories: List<ListCategory>.from(
            json["listCategories"].map((x) => ListCategory.fromJson(x))),
        userName: json["userName"],
        usesId: json["usesId"],
        averageRating: json["averageRating"],
        rating: json["rating"],
        bookmark: json["bookmark"],
        isReport: json["isReport"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createDate": createDate.toIso8601String(),
        "updateDate": updateDate.toIso8601String(),
        "cookingMethodId": cookingMethodId,
        "method": method,
        "recipeRegionId": recipeRegionId,
        "description": description,
        "continents": continents,
        "userId": userId,
        "status": status,
        "imageUrl": imageUrl,
        "videoUrl": videoUrl,
        "listCategories":
            List<dynamic>.from(listCategories.map((x) => x.toJson())),
        "userName": userName,
        "usesId": usesId,
        "averageRating": averageRating,
        "rating": rating,
        "bookmark": bookmark,
        "isReport": isReport,
      };
}

class ListCategory {
  ListCategory({
    required this.id,
    required this.type,
  });

  int id;
  String type;

  factory ListCategory.fromJson(Map<String, dynamic> json) => ListCategory(
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
}

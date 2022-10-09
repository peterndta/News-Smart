// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.email,
    required this.name,
    required this.imageUrl,
  });

  String email;
  String name;
  String imageUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "imageUrl": imageUrl,
      };
}

// To parse this JSON data, do
//
//     final useItem = useItemFromJson(jsonString);

import 'dart:convert';

UseItem useItemFromJson(String str) => UseItem.fromJson(json.decode(str));

String useItemToJson(UseItem data) => json.encode(data.toJson());

class UseItem {
  UseItem({
    required this.id,
    required this.usesOfFood,
  });

  int id;
  String usesOfFood;

  factory UseItem.fromJson(Map<String, dynamic> json) => UseItem(
        id: json["id"],
        usesOfFood: json["usesOfFood"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usesOfFood": usesOfFood,
      };
}

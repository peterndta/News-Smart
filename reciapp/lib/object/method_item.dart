// To parse this JSON data, do
//
//     final methodItem = methodItemFromJson(jsonString);

import 'dart:convert';

MethodItem methodItemFromJson(String str) =>
    MethodItem.fromJson(json.decode(str));

String methodItemToJson(MethodItem data) => json.encode(data.toJson());

class MethodItem {
  MethodItem({
    required this.id,
    required this.method,
  });

  int id;
  String method;

  factory MethodItem.fromJson(Map<String, dynamic> json) => MethodItem(
        id: json["id"],
        method: json["method"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "method": method,
      };
}

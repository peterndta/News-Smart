// To parse this JSON data, do
//
//     final regionItem = regionItemFromJson(jsonString);

import 'dart:convert';

RegionItem regionItemFromJson(String str) =>
    RegionItem.fromJson(json.decode(str));

String regionItemToJson(RegionItem data) => json.encode(data.toJson());

class RegionItem {
  RegionItem({
    required this.id,
    required this.continents,
  });

  int id;
  String continents;

  factory RegionItem.fromJson(Map<String, dynamic> json) => RegionItem(
        id: json["id"],
        continents: json["continents"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "continents": continents,
      };
}

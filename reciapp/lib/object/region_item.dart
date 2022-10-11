// To parse this JSON data, do
//
//     final regionItem = regionItemFromJson(jsonString);
import 'package:http/http.dart' as http;
import 'dart:convert';

RegionItem regionItemFromJson(String str) =>
    RegionItem.fromJson(json.decode(str));

String regionItemToJson(RegionItem data) => json.encode(data.toJson());

Future fetchRegions() async {
  http.Response response = await http.get(
    Uri.parse('https://reciapp.azurewebsites.net/api/RecipeRegions'),
    headers: {
      "content-type": "application/json",
      "accept": "application/json",
    },
  );
  var responseJson = json.decode(response.body);
  return (responseJson['data'] as List)
      .map((p) => RegionItem.fromJson(p))
      .toList();
}

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

  @override
  String toString() {
    // TODO: implement toString
    return continents;
  }
}

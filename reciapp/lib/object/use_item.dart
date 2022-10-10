// To parse this JSON data, do
//
//     final useItem = useItemFromJson(jsonString);
import 'package:http/http.dart' as http;
import 'dart:convert';

UseItem useItemFromJson(String str) => UseItem.fromJson(json.decode(str));

String useItemToJson(UseItem data) => json.encode(data.toJson());

Future fetchUses() async {
  http.Response response = await http.get(
    Uri.parse('https://reciapp.azurewebsites.net/api/Uses'),
    headers: {
      "content-type": "application/json",
      "accept": "application/json",
    },
  );
  var responseJson = json.decode(response.body);
  return (responseJson['data'] as List)
      .map((p) => UseItem.fromJson(p))
      .toList();
}
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

    @override
  String toString() {
    // TODO: implement toString
    return usesOfFood;
  }
}

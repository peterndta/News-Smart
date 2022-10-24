// To parse this JSON data, do
//
//     final methodItem = methodItemFromJson(jsonString);
import 'package:http/http.dart' as http;
import 'dart:convert';

MethodItem methodItemFromJson(String str) =>
    MethodItem.fromJson(json.decode(str));

String methodItemToJson(MethodItem data) => json.encode(data.toJson());

Future fetchMethods() async {
  http.Response response = await http.get(
    Uri.parse('https://reciapp.azurewebsites.net/api/cookingmethod'),
    headers: {
      "content-type": "application/json",
      "accept": "application/json",
    },
  );
  var responseJson = json.decode(response.body);
  return (responseJson['data'] as List)
      .map((p) => MethodItem.fromJson(p))
      .toList();
}

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

  @override
  String toString() {
    // TODO: implement toString
    return method;
  }
}

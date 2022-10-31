import 'package:http/http.dart' as http;
import 'dart:convert';

Future fetchCollections() async {
  http.Response response = await http.get(
    Uri.parse('https://reciapp.azurewebsites.net/api/collection'),
    headers: {
      "content-type": "application/json",
      "accept": "application/json",
    },
  );
  var responseJson = json.decode(response.body);
  var listItem = (responseJson['data'] as List)
      .map((p) => CollectionItem.fromJson(p))
      .toList();

  return listItem.map((e) => e.collectionName).toList();
}

class CollectionItem {
  CollectionItem({
    required this.id,
    required this.collectionName,
  });

  int id;
  String collectionName;

  factory CollectionItem.fromJson(Map<String, dynamic> json) => CollectionItem(
        id: json["id"],
        collectionName: json["collectionName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "collectionName": collectionName,
      };

  @override
  String toString() {
    // TODO: implement toString
    return collectionName;
  }
}

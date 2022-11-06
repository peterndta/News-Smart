// To parse this JSON data, do
//
//     final notificationItem = notificationItemFromJson(jsonString);

import 'dart:convert';

NotificationItem notificationItemFromJson(String str) =>
    NotificationItem.fromJson(json.decode(str));

String notificationItemToJson(NotificationItem data) =>
    json.encode(data.toJson());

class NotificationItem {
  NotificationItem({
    required this.id,
    required this.name,
    required this.message,
    required this.imageUrl,
    required this.createDate,
  });

  int id;
  String name;
  String message;
  String imageUrl;
  DateTime createDate;

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      NotificationItem(
        id: json["id"],
        name: json["name"],
        message: json["message"],
        imageUrl: json["imageUrl"],
        createDate: DateTime.parse(json["createDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "message": message,
        "imageUrl": imageUrl,
        "createDate": createDate.toString(),
      };
}

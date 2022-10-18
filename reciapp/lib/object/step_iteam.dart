// To parse this JSON data, do
//
//     final stepItem = stepItemFromJson(jsonString);

import 'dart:convert';

StepItem stepItemFromJson(String str) => StepItem.fromJson(json.decode(str));

String stepItemToJson(StepItem data) => json.encode(data.toJson());

class StepItem {
    StepItem({
        required this.id,
        required this.postsId,
        required this.ingredient,
        required this.processing,
        required this.cooking,
        required this.tool,
        required this.processingTime,
        required this.cookingTime,
        required this.preparingTime,
        required this.serving,
    });

    int id;
    String postsId;
    String ingredient;
    String processing;
    String cooking;
    String tool;
    int processingTime;
    int cookingTime;
    int preparingTime;
    int serving;

    factory StepItem.fromJson(Map<String, dynamic> json) => StepItem(
        id: json["id"],
        postsId: json["postsId"],
        ingredient: json["ingredient"],
        processing: json["processing"],
        cooking: json["cooking"],
        tool: json["tool"],
        processingTime: json["processingTime"],
        cookingTime: json["cookingTime"],
        preparingTime: json["preparingTime"],
        serving: json["serving"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "postsId": postsId,
        "ingredient": ingredient,
        "processing": processing,
        "cooking": cooking,
        "tool": tool,
        "processingTime": processingTime,
        "cookingTime": cookingTime,
        "preparingTime": preparingTime,
        "serving": serving,
    };
}

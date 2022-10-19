class PostDetail {
  PostDetail({
    required this.id,
    required this.name,
    required this.createDate,
    required this.updateDate,
    required this.cookingMethodId,
    required this.method,
    required this.recipeRegionId,
    required this.description,
    required this.continents,
    required this.userId,
    required this.status,
    required this.imageUrl,
    required this.videoUrl,
    required this.listCategories,
    required this.userName,
    required this.usesId,
    required this.averageRating,
    required this.ingredient,
    required this.processing,
    required this.cooking,
    required this.tool,
    required this.processingTime,
    required this.cookingTime,
    required this.preparingTime,
    required this.serving,
  });

  String id;
  String name;
  DateTime createDate;
  DateTime updateDate;
  int cookingMethodId;
  String method;
  int recipeRegionId;
  String description;
  String continents;
  int userId;
  int status;
  String imageUrl;
  String videoUrl;
  List<ListCategory> listCategories;
  String userName;
  int usesId;
  int averageRating;
  String ingredient;
  String processing;
  String cooking;
  String tool;
  int processingTime;
  int cookingTime;
  int preparingTime;
  int serving;

  factory PostDetail.fromJson(
          Map<String, dynamic> json1, Map<String, dynamic> json2) =>
      PostDetail(
        id: json1["id"],
        name: json1["name"],
        createDate: DateTime.parse(json1["createDate"]),
        updateDate: DateTime.parse(json1["updateDate"]),
        cookingMethodId: json1["cookingMethodId"],
        method: json1["method"],
        recipeRegionId: json1["recipeRegionId"],
        description: json1["description"],
        continents: json1["continents"],
        userId: json1["userId"],
        status: json1["status"],
        imageUrl: json1["imageUrl"],
        videoUrl: json1["videoUrl"],
        listCategories: List<ListCategory>.from(
            json1["listCategories"].map((x) => ListCategory.fromJson(x))),
        userName: json1["userName"],
        usesId: json1["usesId"],
        averageRating: json1["averageRating"],
        ingredient: json2["ingredient"],
        processing: json2["processing"],
        cooking: json2["cooking"],
        tool: json2["tool"],
        processingTime: json2["processingTime"],
        cookingTime: json2["cookingTime"],
        preparingTime: json2["preparingTime"],
        serving: json2["serving"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createDate": createDate.toIso8601String(),
        "updateDate": updateDate.toIso8601String(),
        "cookingMethodId": cookingMethodId,
        "method": method,
        "recipeRegionId": recipeRegionId,
        "description": description,
        "continents": continents,
        "userId": userId,
        "status": status,
        "imageUrl": imageUrl,
        "videoUrl": videoUrl,
        "listCategories":
            List<dynamic>.from(listCategories.map((x) => x.toJson())),
        "userName": userName,
        "usesId": usesId,
        "averageRating": averageRating,
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

class ListCategory {
  ListCategory({
    required this.id,
    required this.type,
  });

  int id;
  String type;

  factory ListCategory.fromJson(Map<String, dynamic> json) => ListCategory(
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
  @override
  String toString() {
    return type;
  }
}

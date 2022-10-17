class UserData {
  int userID;
  String token;
  String imageURL;
  String name;
  String role;
  String mail;
  UserData(
      {required this.userID,
      required this.token,
      required this.imageURL,
      required this.name,
      required this.role,
      required this.mail});
  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userID: json["userID"],
        token: json["token"],
        imageURL: json["imageURL"],
        name: json["name"],
        role: json["role"],
        mail: json["mail"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userID,
        "token": token,
        "imageURL": imageURL,
        "name": name,
        "role": role,
        "mail": mail,
      };
}
// To parse this JSON data, do
//
//     final shopLoginModel = shopLoginModelFromJson(jsonString);

import 'dart:convert';

ShopLoginModel shopLoginModelFromJson(String str) => ShopLoginModel.fromJson(json.decode(str));

String shopLoginModelToJson(ShopLoginModel data) => json.encode(data.toJson());

class ShopLoginModel {
  ShopLoginModel({
    required this.data,
  });

  Data data;

  factory ShopLoginModel.fromJson(Map<String, dynamic> json) => ShopLoginModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.message,
    required this.user,
    required this.token,
  });

  String message;
  User user;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    required this.name,
    required this.userName,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String name;
  String userName;
  String email;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    userName: json["user_name"],
    email: json["email"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "user_name": userName,
    "email": email,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}

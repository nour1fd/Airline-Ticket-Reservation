import 'dart:convert';
List<addModel> modelFromJson(String str) => List<addModel>.from(json.decode(str).map((x) => addModel.fromJson(x)));

String modelToJson(List<addModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class addModel {
  addModel({
    required this.cash,
    required this.userId,
    required this.id,
  });

  int cash;
  int userId;
  int id;

  factory addModel.fromJson(Map<String, dynamic> json) => addModel(
    cash: json["cash"],
    userId: json["user_id"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "cash": cash,
    "user_id": userId,
    "id": id,
  };
}

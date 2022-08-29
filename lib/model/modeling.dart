import 'package:meta/meta.dart';
import 'dart:convert';

List<Model> modelFromJson(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
  Model({
    required this.cash,
    required this.userId,
   required this.id,
  });

  String cash;
  int userId;
  int id;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
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

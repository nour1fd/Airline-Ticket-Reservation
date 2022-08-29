// To parse this JSON data, do
//
//     final accounts = accountsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Accounts> accountsFromJson(String str) => List<Accounts>.from(json.decode(str).map((x) => Accounts.fromJson(x)));

String accountsToJson(List<Accounts> data) => json.encode(List<Accounts>.from(data.map((x) => x.toJson())));

class Accounts {
  Accounts({
    required this.cash,
    required this.userId,
    required this.id,
  });

  int cash;
  int userId;
  int id;

  factory Accounts.fromJson(Map<String, dynamic> json) => Accounts(
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

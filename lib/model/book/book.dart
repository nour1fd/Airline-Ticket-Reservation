// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book({
    required this.message,
    required this.ticketDetails,
  });

  String message;
  TicketDetails ticketDetails;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    message: json["message"],
    ticketDetails: TicketDetails.fromJson(json["ticket-details"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "ticket-details": ticketDetails.toJson(),
  };
}

class TicketDetails {
  TicketDetails({
    required this.units,
    required this.type,
    required this.cost,
    required this.userId,
    required this.flightId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String units;
  String type;
  int cost;
  int userId;
  String flightId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory TicketDetails.fromJson(Map<String, dynamic> json) => TicketDetails(
    units: json["units"],
    type: json["type"],
    cost: json["cost"],
    userId: json["user_id"],
    flightId: json["flight_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "units": units,
    "type": type,
    "cost": cost,
    "user_id": userId,
    "flight_id": flightId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}

// To parse this JSON data, do
//
//     final flightModel = flightModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FlightModel> flightModelFromJson(String str) => List<FlightModel>.from(json.decode(str).map((x) => FlightModel.fromJson(x)));

String flightModelToJson(List<FlightModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FlightModel {
  FlightModel({
    required this.id,
    required this.country,
    required this.city,
    required this.capacity,
    required this.arrivalsTo,
    required this.departuresFrom,
    required this.dateTime,
    required this.adminId,
  });

  int id;
  String country;
  String city;
  int capacity;
  String arrivalsTo;
  String departuresFrom;
  DateTime dateTime;
  int adminId;

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
    id: json["id"],
    country: json["country"],
    city: json["city"],
    capacity: json["capacity"],
    arrivalsTo: json["arrivals_to"],
    departuresFrom: json["departures_from"],
    dateTime: DateTime.parse(json["date_time"]),
    adminId: json["admin_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country": country,
    "city": city,
    "capacity": capacity,
    "arrivals_to": arrivalsTo,
    "departures_from": departuresFrom,
    "date_time": dateTime.toIso8601String(),
    "admin_id": adminId,
  };
}

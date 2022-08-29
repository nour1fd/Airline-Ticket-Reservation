import 'dart:convert';

List<FlightModeladmin> flightModelFromJson(String str) => List<FlightModeladmin>.from(json.decode(str).map((x) => FlightModeladmin.fromJson(x)));

String flightModelToJson(List<FlightModeladmin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FlightModeladmin {
  FlightModeladmin({
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

  factory FlightModeladmin.fromJson(Map<String, dynamic> json) => FlightModeladmin(
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

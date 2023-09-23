import 'package:flutter/material.dart';

class TravelerModel {
  String name = "";
  String email = "";
  String password = "";
  String address = "";
  String phoneNumber = "";
  String cnic = "";
  String profile = "";

  TravelerModel.add(
    this.profile, {
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.phoneNumber,
    required this.cnic,
  });

  TravelerModel.fromJson(Map<dynamic, String> json) {
    if (json["name"] is String || json["name"] is int) {
      name = json["name"].toString();
    }
    if (json["email"] is String || json["email"] is int) {
      email = json["email"].toString();
    }
    if (json["password"] is String || json["password"] is int) {
      password = json["password"].toString();
    }
    if (json["phoneNumber"] is String || json["phoneNumber"] is int) {
      phoneNumber = json["phoneNumber"].toString();
    }
    if (json["cnic"] is String || json["cnic"] is int) {
      cnic = json["cnic"].toString();
    }
    if (json["profile"] is String || json["profile"] is int) {
      profile = json["profile"].toString();
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "cnic": cnic,
      "profile": profile
    };

    return result;
  }
}

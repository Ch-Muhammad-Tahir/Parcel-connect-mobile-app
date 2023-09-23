import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_parcel_connect/services/firebase_manager.dart';

import '../models/receiver_model.dart';
import '../models/sender_model.dart';

class BriefModel {
  String parcelSize = "";
  String bid = "";
  String parcelCategory = "";
  String itemName = "";
  String parcelValue = "";
  String cost = "";
  SenderModel? sender;
  ReceiverModel? receiver;
  Timestamp? timeStamp;
  BriefModel.add(
      {required this.parcelSize,
      required this.parcelCategory,
      required this.itemName,
      required this.parcelValue,
      required this.cost,
      required this.sender,
      required this.receiver});
  BriefModel.fromJson(Map<String, dynamic> json) {
    if (json["parcelSize"] is String || json["parcelSize"] is int) {
      parcelSize = json["parcelSize"].toString();
    }
    if (json["parcelCategory"] is String || json["parcelCategory"] is int) {
      parcelCategory = json["parcelCategory"].toString();
    }
    if (json["itemName"] is String || json["itemName"] is int) {
      itemName = json["itemName"].toString();
    }
    if (json["parcelValue"] is String || json["parcelValue"] is int) {
      parcelValue = json["parcelValue"].toString();
    }
    if (json["cost"] is String || json["cost"] is int) {
      cost = json["cost"].toString();
    }
    if (json["sender"] is Object) {
      sender = SenderModel.fromJson(json["sender"]);
    }
    if (json["receiver"] is Object) {
      receiver = ReceiverModel.fromJson(json["receiver"]);
    }
    if (json["timeStamp"] is Timestamp) {
      timeStamp = json["timeStamp"];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "parcelSize": parcelSize,
      "parcelCategory": parcelCategory,
      "itemName": itemName,
      "parcelValue": parcelValue,
      "cost": cost,
      "sender": sender!.toMap(),
      "receiver": receiver!.toMap(),
      "userId": FirebaseManager.firebaseAuth.currentUser!.uid,
      "timeStamp": FieldValue.serverTimestamp(),
    };
    return result;
  }
}

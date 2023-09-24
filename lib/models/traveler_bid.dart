import 'package:cloud_firestore/cloud_firestore.dart';

class TravelerBid {
  String bid = "";
  String travelerID = "";
  String briefID = "";
  String travelerBidID = "";
  Timestamp? timestamp;
  TravelerBid();
  TravelerBid.fromJos(Map<String, dynamic> json) {
    if (json["traveler_id"] is String || json["traveler_id"] is int) {
      travelerID = json["traveler_id"].toString();
    }
    if (json["bid"] is String || json["bid"] is int) {
      bid = json["bid"].toString();
    }
    if (json["traveler_bid_id"] is String || json["traveler_bid_id"] is int) {
      travelerBidID = json["traveler_bid_id"].toString();
    }
    if (json["brief_id"] is String || json["brief_id"] is int) {
      briefID = json["brief_id"].toString();
    }
    if (json["timeStamp"] is Timestamp) {
      timestamp = json["timeStamp"];
    }
  }
}

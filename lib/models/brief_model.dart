import '../models/receiver_model.dart';
import '../models/sender_model.dart';

class BriefModel {
  final String parcelSize;
  final String parcelCategory;
  final String itemName;
  final String parcelValue;
  final String cost;
  final SenderModel sender;
  final ReceiverModel receiver;

  BriefModel(
      {required this.parcelSize,
      required this.parcelCategory,
      required this.itemName,
      required this.parcelValue,
      required this.cost,
      required this.sender,
      required this.receiver});
}

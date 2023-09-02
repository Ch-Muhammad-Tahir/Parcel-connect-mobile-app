import '../../models/parcel_size_model.dart';
import '../../models/receiver_model.dart';
import '../../models/sender_model.dart';

class Parcel {
  final String itemName;
  final String parcelValue;
  final SenderModel sender;
  final ReceiverModel receiver;
  final String parcelSize;
  final String parcelCategory;

  Parcel(
      {required this.itemName,
      required this.parcelValue,
      required this.sender,
      required this.receiver,
      required this.parcelSize,
      required this.parcelCategory});
}

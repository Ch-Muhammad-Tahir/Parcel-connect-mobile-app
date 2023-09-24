import 'package:flutter/material.dart';
import '../services/firebase_manager.dart';
import '../../models/brief_model.dart';
import '../../models/receiver_model.dart';
import '../../models/sender_model.dart';
import '../../utils/helper_functions.dart';
import '../../views/send_parcel_screen/check_out_parcel_screen.dart';
import '../../views/send_parcel_screen/receiver_details_screen.dart';
import '../../views/send_parcel_screen/sender_details.dart';
import '../models/traveler_bid.dart';

class SendParcelProvider extends ChangeNotifier {
  String? parcelSize;
  String? parcelCategory;
  String? itemName;
  String? parcelValue;
  String? cost;
  SenderModel? sender;
  ReceiverModel? receiver;
  List<BriefModel> briefs = [];
  List<TravelerBid> travelerBids = [];

  void selectParcelSize(String parcelSize) {
    this.parcelSize = parcelSize;
  }

  void selectParcelCategory(String category) {
    parcelCategory = category;
  }

  void addReceiverDetails(String name, String phone, String address,
      String city, String? message, BuildContext context) {
    if (name.isEmpty) {
      AppHelperFunction.showToast(
          "Receiver Name is Empty, Please Enter Sender Name", context);
    }
    if (phone.isEmpty) {
      AppHelperFunction.showToast(
          "Receiver Phone Number is Empty, Please Enter Sender Phone Number",
          context);
    }
    if (address.isEmpty) {
      AppHelperFunction.showToast(
          "Receiver is Empty, Please Enter Compete Address", context);
    }
    if (city.isEmpty) {
      AppHelperFunction.showToast("Invalid City, Please Select City", context);
    }
    if (name.isNotEmpty &&
        city.isNotEmpty &&
        address.isNotEmpty &&
        phone.isNotEmpty) {
      receiver = ReceiverModel.add(
          receiverAddress: address,
          receiverCity: city,
          receiverName: name,
          receiverNumber: name);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CheckOutParcelScreenWidget()));
    }
  }

  void addSenderDetails(String name, String phone, String address, String city,
      String pickDate, String? message, BuildContext context) {
    if (name.isEmpty) {
      AppHelperFunction.showToast(
          "Sender Name is Empty, Please Enter Sender Name", context);
    }
    if (phone.isEmpty) {
      AppHelperFunction.showToast(
          "Sender Phone Number is Empty, Please Enter Sender Phone Number",
          context);
    }
    if (address.isEmpty) {
      AppHelperFunction.showToast(
          "Address is Empty, Please Enter Compete Address", context);
    }
    if (city.isEmpty) {
      AppHelperFunction.showToast("Invalid City, Please Select City", context);
    }
    if (pickDate.isEmpty) {
      AppHelperFunction.showToast(
          "Invalid PickUp Date, Please select Date From Calendar", context);
    } else {
      sender = SenderModel.add(
          senderName: name,
          senderNumber: phone,
          senderAddress: address,
          senderCity: city,
          pickUpDate: pickDate);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReceiverDetailsScreenWidget()));
    }
  }

  void getCost(String cost, BuildContext context) {
    if (cost.isEmpty) {
      AppHelperFunction.showToast("Invalid Cost", context);
    } else {
      int deliveryCost = int.tryParse(cost)!;
      if (deliveryCost <= 0) {
        AppHelperFunction.showToast("Invalid Cost", context);
      } else {
        this.cost = cost;
        // postBrief();
        FirebaseManager.storeBriefsOnFirebase(
            brief: BriefModel.add(
                parcelSize: parcelSize!,
                parcelCategory: parcelCategory!,
                itemName: itemName!,
                parcelValue: parcelValue!,
                cost: cost!,
                sender: sender!,
                receiver: receiver!));
        for (int i = 0; i < 6; i++) {
          Navigator.pop(context);
        }
      }
    }
  }

  void getBriefs() async {
    briefs = await FirebaseManager.getBriefsForCurrentUser();
    print(briefs.length);
  }

  void postBrief() {
    briefs.add(BriefModel.add(
        parcelSize: parcelSize!,
        parcelCategory: parcelCategory!,
        itemName: itemName!,
        parcelValue: parcelValue!,
        cost: cost!,
        sender: sender!,
        receiver: receiver!));
  }

  void addParcelDetails(
      String itemName, String parcelValue, BuildContext context) {
    if (itemName.isEmpty && parcelValue.isEmpty) {
      AppHelperFunction.showToast("Item Name & Parcel Value is Empty", context);
    } else {
      if (itemName.isEmpty) {
        AppHelperFunction.showToast("Item Name Can't be Empty", context);
      }
      if (parcelValue.isEmpty) {
        AppHelperFunction.showToast("Parcel Value Can't be Empty", context);
      } else {
        this.itemName = itemName;
        this.parcelValue = parcelValue;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SenderDetailsScreenWidget()));
      }
    }
  }

  void getTravelersBid(String currentBriefID) async {
    travelerBids = await FirebaseManager.getBidsByBriefID(currentBriefID);
    notifyListeners();
    print(travelerBids.length);
  }

  void getTravelerByID(String id) async {
    await FirebaseManager.getTravelerByUID(id);
  }
}

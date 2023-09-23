import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/models/travelerModel.dart';
import 'package:fyp_parcel_connect/services/firebase_manager.dart';

class TravelerAuthProvider extends ChangeNotifier {
  TravelerModel travelerl = TravelerModel();
  File? profileImage;
  File? documentImage;

  get travelerModel => null;
  void getData(String name, String email, String password, String address,
      String cnic, String phone) {
    travelerl = TravelerModel.add(
        name: name,
        email: email,
        password: password,
        address: address,
        phoneNumber: phone,
        cnic: cnic);
    notifyListeners();
  }

  void getDocuments(File profileImage, File documentImage) {
    this.profileImage = profileImage;
    this.documentImage = documentImage;
    log(travelerl.toMap().toString());
  }

  void travelerLogin(String email, String password, BuildContext context) {
    FirebaseManager.travelerSignIn(email, password, context);
  }

  Future<void> singUpTraveler() async {
    TravelerModel traveler = TravelerModel.add(
        name: "12",
        email: "a@b.com",
        password: "k2Mp@uXe",
        address: "axxe",
        phoneNumber: "0332112",
        cnic: "2331222");
    FirebaseManager.signUpTraveler(
        travelerModel: traveler,
        profile: profileImage!,
        document: documentImage!);
  }
}

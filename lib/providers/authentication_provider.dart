import 'dart:io';

import '../services/firebase_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthenticationProvider extends ChangeNotifier {
  String currentUserUid = "";
  File? pickedimg;

  Future<bool> fabLoginOnPressed(String number, BuildContext context) async {
    bool validNumber =
        await FirebaseManager.verifyUserPhoneNumber(number, context);
    return validNumber;
  }

  Future<bool> btnOnTabVerifyOtp(String otp, BuildContext context) async {
    bool isValidOtp = await FirebaseManager.verifyOtp(otp, context);
    return isValidOtp;
  }

  Future<bool> storeDataOnfirebase(
      String name, BuildContext context, File image) async {
    bool isDataStored = await FirebaseManager.storeUserDataOnFirebase(
        userName: name, image: image);
    return isDataStored;
  }

  Future<File?> pickedImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      var file = File(image.path);
      pickedimg = file;
      notifyListeners();
      return file;
    }

    return null;
  }
}

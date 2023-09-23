import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fyp_parcel_connect/models/brief_model.dart';

import '../models/travelerModel.dart';
import '../utils/helper_functions.dart';
import '../views/traveler_screens/traveler_home_page_screen/traveler_nav_bar_screens.dart';

class FirebaseManager {
  static late String userPhoneNumber;
  static late String verficationID;
  static String currentUserUid = "";
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static Future<bool> verifyUserPhoneNumber(
      String number, BuildContext context) async {
    late bool isValidNumber = false;
    print(number);
    await firebaseAuth
        .verifyPhoneNumber(
            phoneNumber: number,
            verificationCompleted: (_) {},
            verificationFailed: (e) {
              AppHelperFunction.showToast("Verification Failed", context);
            },
            codeSent: (String verificationID, int? token) {
              verficationID = verificationID;
            },
            codeAutoRetrievalTimeout: (e) {})
        .then((value) => isValidNumber = true);
    print("Valur of $isValidNumber");
    return isValidNumber;
  }

  static Future<bool> verifyOtp(String otp, BuildContext context) async {
    var credential = PhoneAuthProvider.credential(
        verificationId: verficationID, smsCode: otp);
    try {
      await firebaseAuth.signInWithCredential(credential);
      AppHelperFunction.showToast("OTP varified", context);
      if (firebaseAuth.currentUser != null) {
        currentUserUid = firebaseAuth.currentUser!.uid;
        userPhoneNumber = firebaseAuth.currentUser!.phoneNumber!;
        return true;
      }
      print(firebaseAuth.currentUser!.uid);
    } catch (e) {
      AppHelperFunction.showToast("InValid OTP", context);
    }
    return false;
  }

  static Future<bool> storeUserDataOnFirebase(
      {required String userName, required File image}) async {
    var imgPath = await storeImageOnFirebaseCloud(image);
    var collection = FirebaseFirestore.instance.collection("users");
    await collection.doc(currentUserUid).set({
      "userName": userName,
      "uId": currentUserUid,
      "phoneNumber": userPhoneNumber,
      "imageUrl": imgPath,
    });
    if (collection.doc(currentUserUid).id == currentUserUid) {
      return true;
    } else {
      return false;
    }
  }

  static CollectionReference getDataFromDatabase(
      {required String collectionName}) {
    print("getDataFromDatabase is Calling ");
    CollectionReference dBCollectionReference =
        FirebaseFirestore.instance.collection(collectionName);
    return dBCollectionReference;
  }

  static Future<void> storeBriefsOnFirebase({required BriefModel brief}) async {
    var collection = FirebaseFirestore.instance.collection("Briefs");
    var id = collection.doc().id;
    await collection.doc(id).set({}
      ..addAll(
        brief.toMap(),
      )
      ..addAll({"briefId": id}));
  }

  static Future<dynamic> storeImageOnFirebaseCloud(File imagePath) async {
    final Reference storageRefrence = FirebaseStorage.instance.ref().child(
        "images/${FirebaseManager.currentUserUid}/${FirebaseManager.currentUserUid}.png");
    final UploadTask uploadTask = storageRefrence.putFile(imagePath);
    final TaskSnapshot snapshot = await uploadTask;
    final imgUrl = await snapshot.ref.getDownloadURL();
    return imgUrl;
  }

  static Future<UserCredential> signUpOnFirebase(
      String email, String password) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<UserCredential> signInUser(
      String email, String password) async {
    print("Hello");
    return await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<List<BriefModel>> getBriefsForCurrentUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      final collection = FirebaseFirestore.instance.collection("Briefs");

      final querySnapshot =
          await collection.where("userId", isEqualTo: userId).get();

      return querySnapshot.docs.map((doc) {
        return BriefModel.fromJson(doc.data());
      }).toList();
    } else {
      // Handle the case where the user is not logged in.
      return [];
    }
  }

  static Future<List<BriefModel>> getAllBriefs() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final collection = FirebaseFirestore.instance.collection("Briefs");
      final querySnapshot = await collection.get();

      return querySnapshot.docs.map((doc) {
        return BriefModel.fromJson(doc.data());
      }).toList();
    } else {
      // Handle the case where the user is not logged in.
      return [];
    }
  }

  static Future<void> travelerSignIn(
      String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                settings: const RouteSettings(name: "/travelerHomeScreen"),
                builder: (context) =>
                    const TravelerBottomNavBarScreenWidgets()),
            (Route<dynamic> route) => false);
      }
      print('No user found for that email.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppHelperFunction.showToast("No user found for that email.", context);
      } else if (e.code == 'wrong-password') {
        AppHelperFunction.showToast(
            'Wrong password provided for that user.', context);
        print('Wrong password provided for that user.');
      }
    }
  }

  static void signUpTraveler(
      {required TravelerModel travelerModel,
      required File profile,
      required File document}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: travelerModel.email,
        password: travelerModel.password,
      );
      await storeTravelerDataOnFirebase(
          traver: travelerModel,
          profile: profile,
          document: document,
          uID: credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> storeTravelerDataOnFirebase(
      {required TravelerModel traver,
      required File profile,
      required File document,
      required String uID}) async {
    List<String> imgPath =
        await storeTravelerImagesOnFirebaseCloud(profile, document, uID);

    var collection = FirebaseFirestore.instance.collection("traveler");
    await collection.doc(uID).set({}
      ..addAll(traver.toMap())
      ..addAll({
        "profileImage": imgPath[0],
        "document": imgPath[1],
      }));
    if (collection.doc(currentUserUid).id == currentUserUid) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<String>> storeTravelerImagesOnFirebaseCloud(
      File image1, File image2, String id) async {
    List<String> imageUrls = [];

    // Upload the first image
    final Reference storageReference1 =
        FirebaseStorage.instance.ref().child("images/$id/profile.png");
    final UploadTask uploadTask1 = storageReference1.putFile(image1);
    final TaskSnapshot snapshot1 = await uploadTask1;
    final imgUrl1 = await snapshot1.ref.getDownloadURL();
    imageUrls.add(imgUrl1);

    // Upload the second image
    final Reference storageReference2 =
        FirebaseStorage.instance.ref().child("images/$id/cnic.png");
    final UploadTask uploadTask2 = storageReference2.putFile(image2);
    final TaskSnapshot snapshot2 = await uploadTask2;
    final imgUrl2 = await snapshot2.ref.getDownloadURL();
    imageUrls.add(imgUrl2);

    return imageUrls;
  }
}

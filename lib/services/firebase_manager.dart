import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fyp_parcel_connect/models/brief_model.dart';

import '../utils/helper_functions.dart';

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
    await collection.add(brief.toMap());
  }

  // static Future<void> sendMessage(
  //     {required String message,
  //     required String reciverId,
  //     required String chatRoomId}) async {
  //   var chatRoomCollection = FirebaseFirestore.instance
  //       .collection("chats")
  //       .doc(chatRoomId)
  //       .collection("messages");
  //   chatRoomCollection.add({
  //     "senderUid": currentUserUid,
  //     "reciverUid": reciverId,
  //     "messageText": message,
  //     "isRead": false,
  //     "timeStamp": FieldValue.serverTimestamp(),
  //   });
  // }

  static Future<dynamic> storeImageOnFirebaseCloud(File imagePath) async {
    final Reference storageRefrence = FirebaseStorage.instance.ref().child(
        "images/${FirebaseManager.currentUserUid}/${FirebaseManager.currentUserUid}.png");
    final UploadTask uploadTask = storageRefrence.putFile(imagePath);
    final TaskSnapshot snapshot = await uploadTask;
    final imgUrl = await snapshot.ref.getDownloadURL();
    return imgUrl;
  }

  // static Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   List<String> ids = [userId, otherUserId];
  //   ids.sort();
  //   String chatroomId = ids.join("_");

  //   return firestore
  //       .collection("chats")
  //       .doc(chatroomId)
  //       .collection("messages")
  //       .orderBy("timeStamp", descending: false)
  //       .snapshots();
  // }

  // static CollectionReference getChatMessages({required String chatRoomId}) {
  //   CollectionReference messagesCollectionReference = FirebaseFirestore.instance
  //       .collection("chats")
  //       .doc(chatRoomId)
  //       .collection("messages");
  //   return messagesCollectionReference;
  // }

  // static Map<String, dynamic>? getLastMessage(String chatRoomId) {
  //   Map<String, dynamic>? recentMessage;
  //   final messagesRef = FirebaseFirestore.instance
  //       .collection('chat')
  //       .doc(chatRoomId)
  //       .collection("messages")
  //       .orderBy('timestamp', descending: true)
  //       .limit(1)
  //       .snapshots() // realtime update
  //       .listen((querySnapshot) {
  //     final lastMessage = querySnapshot.docs.first.data();
  //     recentMessage = lastMessage;
  //   });
  //   return recentMessage;
  // }

  // static Future<DocumentReference<Map<String, dynamic>>> getSpecificUserData(
  //     String uId) async {
  //   var doc = await FirebaseFirestore.instance.collection("users").doc(uId);
  //   return doc;
  // }
}

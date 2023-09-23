import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/providers/traveler_auth_provider.dart';
import 'package:fyp_parcel_connect/utils/helper_functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class TravelerVerificationScreen extends StatefulWidget {
  const TravelerVerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<TravelerVerificationScreen> {
  File? _profileImage;
  File? _documentImage;

  final picker = ImagePicker();

  Future getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getDocumentImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _documentImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Verify Document"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_profileImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.file(
                    _profileImage!,
                    height: 300,
                    width: 300,
                  ),
                ),
              ElevatedButton(
                onPressed: getProfileImage,
                child: const Text('Take Profile Picture'),
              ),
              if (_documentImage != null)
                Image.file(
                  _documentImage!,
                  height: 300,
                  width: 300,
                ),
              ElevatedButton(
                onPressed: getDocumentImage,
                child: const Text('Take Document Picture'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_profileImage == null || _documentImage == null) {
                    AppHelperFunction.showToast(
                        "Document or Profile is Empty!. Please Upload Both Things",
                        context);
                  } else {
                    Provider.of<TravelerAuthProvider>(context, listen: false)
                        .getDocuments(_profileImage!, _documentImage!);

                    log(_profileImage!.path);
                    log(_documentImage!.path);
                    await Provider.of<TravelerAuthProvider>(context,
                            listen: false)
                        .singUpTraveler();
                    // ignore: use_build_context_synchronously
                    AppHelperFunction.showToast(
                        "User Successfully SingUp", context);
                    for (int i = 0; i < 2; i++) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: const Text('Sign Up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

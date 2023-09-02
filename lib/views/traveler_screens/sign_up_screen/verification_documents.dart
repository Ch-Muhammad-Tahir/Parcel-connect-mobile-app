import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getDocumentImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

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
                Image.file(
                  _profileImage!,
                  height: 300,
                  width: 300,
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
                onPressed: () {
                  // Navigate to sign up screen
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

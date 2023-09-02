import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/utils/helper_functions.dart';
import 'package:fyp_parcel_connect/views/home_page/nav_bar_screens.dart';
import 'package:provider/provider.dart';
import '../../providers/authentication_provider.dart';

class GetUserDetailScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  File? _pickedImage;
  GetUserDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    _pickedImage =
        Provider.of<AuthenticationProvider>(context, listen: true).pickedimg;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () async {
                Provider.of<AuthenticationProvider>(context, listen: false)
                    .pickedImage()
                    .then((value) {
                  print(value!.absolute);
                });
              },
              child: CircleAvatar(
                radius: 80,
                backgroundImage:
                    _pickedImage != null ? FileImage(_pickedImage!) : null,
                child: _pickedImage == null
                    ? const Icon(Icons.person, size: 80)
                    : null, // Display an icon when no image is selected
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Align(
                alignment: Alignment.centerLeft, child: Text("Full Name")),
            TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: "Enter Full Name"),
            ),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              child: const Text("Continue"),
              onPressed: () {
                String name = controller.text.trim();
                if (name.isNotEmpty && (_pickedImage != null)) {
                  Provider.of<AuthenticationProvider>(context, listen: false)
                      .storeDataOnfirebase(name, context, _pickedImage!)
                      .then((userAdded) {
                    if (userAdded) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const BottomNavBarScreenWidgets()));
                    } else {
                      AppHelperFunction.showToast("Server Error", context);
                    }
                  });
                } else {
                  AppHelperFunction.showToast("Name Can't be", context);
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../widgets/my_custom_text.dart';

class ProfileScreenWidget extends StatelessWidget {
  const ProfileScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Profile"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.amber,
        child: const Center(
            child: MyCustomText(
          text: "Profile",
        )),
      ),
    );
  }
}

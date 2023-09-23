import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/utils/media_query.dart';
import 'package:fyp_parcel_connect/widgets/my_custom_text.dart';

class TravelerHomeScreenWidget extends StatelessWidget {
  const TravelerHomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = GetScreenSize.getScreenWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("Home Page"),
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCustomText(
                  text: "Wanna Traveling", fontSize: screenSize * 0.05),
              
            ],
          ),MyCustomText(text: "Pick City",fontSize: screenSize * 0.05)
        ],
      ),
    );
  }
}

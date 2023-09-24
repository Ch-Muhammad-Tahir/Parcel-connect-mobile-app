import 'package:flutter/material.dart';
import '../../../utils/media_query.dart';

class ManageParcelScreen extends StatelessWidget {
  const ManageParcelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manage Parcel"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        //color: Colors.grey.shade100,
        child: Center(
            child: Image.asset(
          "assets/images/empty-box.png",
          height: GetScreenSize.getScreenWidth(context) * 0.7,
        )),
      ),
    );
  }
}

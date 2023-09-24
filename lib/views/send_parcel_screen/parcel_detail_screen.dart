import 'package:flutter/material.dart';
import '../../providers/send_parcel_provide.dart';
import '../../utils/media_query.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/my_custom_text.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_text_field.dart';

class ParcelDetailScreen extends StatelessWidget {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController parcelValueController = TextEditingController();
  ParcelDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = GetScreenSize.getScreenWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Parcel Details"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          MyCustomText(
            text: "Enter Parcel Details",
            fontSize: screenWidth * 0.06,
          ),
          CustomSizedBox(
            height: screenWidth * 0.1,
          ),
          CustomTextField(
            controller: itemNameController,
            labelText: "Item Name",
            hintText: "Enter Item Name",
          ),
          CustomSizedBox(
            height: screenWidth * 0.05,
          ),
          CustomTextField(
            controller: parcelValueController,
            labelText: "Parcel Value",
            hintText: r"Parcel Value ie: 500$",
          ),
          const Expanded(child: SizedBox()),
          CustomTextButton(
              padding: const EdgeInsets.symmetric(vertical: 13),
              onTab: () {
                String itemName = itemNameController.text.trim();
                String parcelValue = parcelValueController.text.trim();
                Provider.of<SendParcelProvider>(context, listen: false)
                    .addParcelDetails(itemName, parcelValue, context);
              },
              buttonText: "Next",
              buttonColor: Colors.blue,
              radius: 15,
              fontSize: screenWidth * 0.06),
          CustomSizedBox(
            height: screenWidth * 0.1,
          )
        ]),
      ),
    );
  }
}

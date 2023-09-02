import 'package:flutter/material.dart';
import '../../utils/media_query.dart';
import '../../views/send_parcel_screen/send_parcel_screen_widgets/review_summery_tile.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../providers/send_parcel_provide.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_custom_text.dart';

class CheckOutParcelScreenWidget extends StatelessWidget {
  final TextEditingController costController = TextEditingController();
  CheckOutParcelScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSize = GetScreenSize.getScreenWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const MyCustomText(text: "Check Out"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          Center(
            child: MyCustomText(
              text: "Review Summary",
              fontSize: screenSize * 0.04,
              fontWeight: FontWeight.w700,
            ),
          ),
          CustomSizedBox(
            height: screenSize * 0.04,
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.grey.shade50,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCustomText(
                        text: "Item Name",
                        fontSize: screenSize * 0.035,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.grey,
                      ),
                      MyCustomText(
                        text: Provider.of<SendParcelProvider>(context,
                                listen: true)
                            .itemName!,
                        fontSize: screenSize * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  CustomSizedBox(
                    height: screenSize * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCustomText(
                        text: "Parcel Value",
                        fontSize: screenSize * 0.035,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.grey,
                      ),
                      MyCustomText(
                        text: Provider.of<SendParcelProvider>(context)
                            .parcelValue!,
                        fontSize: screenSize * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  CustomSizedBox(
                    height: screenSize * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCustomText(
                        text: "Parcel Size",
                        fontSize: screenSize * 0.035,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.grey,
                      ),
                      MyCustomText(
                        text: Provider.of<SendParcelProvider>(context)
                            .parcelSize!,
                        fontSize: screenSize * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  CustomSizedBox(
                    height: screenSize * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCustomText(
                        text: "CategoryType",
                        fontSize: screenSize * 0.035,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.grey,
                      ),
                      MyCustomText(
                        text: Provider.of<SendParcelProvider>(context)
                            .parcelCategory!,
                        fontSize: screenSize * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  CustomSizedBox(
                    height: screenSize * 0.025,
                  )
                ]),
              )),
          CustomSizedBox(
            height: screenSize * 0.04,
          ),
          ReviewSummeryTileView(
            isSender: true,
            name: Provider.of<SendParcelProvider>(context, listen: true)
                .sender!
                .senderName,
            address: Provider.of<SendParcelProvider>(context, listen: true)
                .sender!
                .senderAddress,
            number: Provider.of<SendParcelProvider>(context, listen: true)
                .sender!
                .senderNumber,
          ),
          CustomSizedBox(
            height: screenSize * 0.04,
          ),
          ReviewSummeryTileView(
            isSender: false,
            address: Provider.of<SendParcelProvider>(context, listen: true)
                .receiver!
                .receiverAddress,
            name: Provider.of<SendParcelProvider>(context, listen: true)
                .receiver!
                .receiverName,
            number: Provider.of<SendParcelProvider>(context, listen: true)
                .receiver!
                .receiverNumber,
          ),
          CustomSizedBox(
            height: screenSize * 0.07,
          ),
          CustomTextField(
              keyboardType: TextInputType.number,
              controller: costController,
              labelText: "Cost",
              hintText: "Enter Cost For Delivery"),
          CustomSizedBox(
            height: screenSize * 0.1,
          ),
          CustomTextButton(
              padding: const EdgeInsets.symmetric(vertical: 13),
              onTab: () {
                String cost = costController.text.trim();
                Provider.of<SendParcelProvider>(context, listen: false)
                    .getCost(cost, context);
              },
              buttonText: "Post Brief",
              buttonColor: Colors.blue,
              radius: 15,
              fontSize: GetScreenSize.getScreenWidth(context) * 0.06),
          CustomSizedBox(
            height: screenSize * 0.05,
          ),
        ]),
      ),
    );
  }
}

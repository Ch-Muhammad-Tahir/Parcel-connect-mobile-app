import 'package:flutter/material.dart';
import '../../../models/brief_model.dart';
import '../../../utils/media_query.dart';
import '../../../widgets/my_custom_text.dart';

class BriefTileView extends StatelessWidget {
  final BriefModel brief;
  const BriefTileView({super.key, required this.brief});

  @override
  Widget build(BuildContext context) {
    double screenSize = GetScreenSize.getScreenWidth(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue.shade50,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: MyCustomText(
                        text: "Parcel Details",
                        fontSize: screenSize * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenSize * 0.03,
                    ),
                    MyCustomText(
                      text: "Origin Details",
                      fontSize: screenSize * 0.035,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(
                      height: screenSize * 0.03,
                    ),
                    MyCustomText(
                      textAlign: TextAlign.center,
                      text:
                          "${brief.sender!.senderAddress}, + ${brief.sender!.senderCity}",
                      fontSize: screenSize * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: screenSize * 0.15,
                    ),
                    MyCustomText(
                      text: "Destination Details",
                      fontSize: screenSize * 0.035,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(
                      height: screenSize * 0.03,
                    ),
                    MyCustomText(
                      textAlign: TextAlign.center,
                      text:
                          "${brief.receiver!.receiverAddress}, + ${brief.receiver!.receiverCity}",
                      fontSize: screenSize * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: screenSize * 0.04,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyCustomText(
                        text: "Other Details",
                        fontWeight: FontWeight.w800,
                        fontSize: screenSize * 0.04,
                      ),
                    ),
                    SizedBox(
                      height: screenSize * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyCustomText(
                            text: "Item Name",
                            fontWeight: FontWeight.w400,
                            fontSize: screenSize * 0.04,
                          ),
                          MyCustomText(
                            text: brief.itemName,
                            fontWeight: FontWeight.w800,
                            fontSize: screenSize * 0.04,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyCustomText(
                            text: "Parcel Category",
                            fontWeight: FontWeight.w400,
                            fontSize: screenSize * 0.04,
                          ),
                          MyCustomText(
                            text: brief.parcelCategory,
                            fontWeight: FontWeight.w800,
                            fontSize: screenSize * 0.04,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyCustomText(
                            text: "Parcel Size",
                            fontWeight: FontWeight.w400,
                            fontSize: screenSize * 0.04,
                          ),
                          MyCustomText(
                            text: brief.parcelSize,
                            fontWeight: FontWeight.w800,
                            fontSize: screenSize * 0.04,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize * 0.08,
                    ),
                    MyCustomText(
                      fontSize: screenSize * 0.05,
                      text: "\$${brief.cost}",
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

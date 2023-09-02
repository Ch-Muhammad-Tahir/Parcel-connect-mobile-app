import 'package:flutter/material.dart';
import '../../../utils/media_query.dart';
import '../../../widgets/custom_sized_box.dart';
import '../../../widgets/my_custom_text.dart';

class ReviewSummeryTileView extends StatelessWidget {
  final bool isSender;
  final String name;
  final String number;
  final String address;
  const ReviewSummeryTileView(
      {super.key,
      required this.isSender,
      required this.name,
      required this.number,
      required this.address});

  @override
  Widget build(BuildContext context) {
    double screenSize = GetScreenSize.getScreenWidth(context);
    return Card(
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCustomText(
                  text: isSender ? "Sender Name" : "Receiver Name",
                  fontSize: screenSize * 0.035,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.grey,
                ),
                MyCustomText(
                  text: name,
                  fontSize: screenSize * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            CustomSizedBox(
              height: screenSize * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCustomText(
                  text: "Phone Number ",
                  fontSize: screenSize * 0.035,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.grey,
                ),
                MyCustomText(
                  text: number,
                  fontSize: screenSize * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            CustomSizedBox(
              height: screenSize * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCustomText(
                  text: "Address",
                  fontSize: screenSize * 0.035,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.grey,
                ),
                MyCustomText(
                  text: address,
                  fontSize: screenSize * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

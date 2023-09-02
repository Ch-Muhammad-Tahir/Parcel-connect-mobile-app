import 'package:flutter/material.dart';
import '../../../utils/media_query.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/my_custom_text.dart';

class SenderReceiverTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTab;
  const SenderReceiverTile(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.color,
      required this.onTab});

  @override
  Widget build(BuildContext context) {
    double screenSize = GetScreenSize.getScreenWidth(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Material(
        type: MaterialType.card,
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        // elevation: 5,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTab,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Image.asset(
                      image,
                      color: color,
                      height: screenSize * 0.22,
                      width: screenSize * 0.22,
                    )),
                SizedBox(width: screenSize * 0.06),
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyCustomText(
                          text: title,
                          fontSize: screenSize * 0.05,
                          fontWeight: FontWeight.bold),
                      SizedBox(width: screenSize * 0.08),
                      MyCustomText(
                          text: subtitle,
                          textColor: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

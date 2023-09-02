import 'package:flutter/material.dart';
import '../../../utils/media_query.dart';
import '../../../widgets/my_custom_text.dart';

import '../../../models/parcel_size_model.dart';

class MyParcelSize extends StatelessWidget {
  final VoidCallback onTab;
  final ParcelSize parcel;
  const MyParcelSize({
    Key? key,
    required this.parcel,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenSize = GetScreenSize.getScreenWidth(context);
    return Material(
      // elevation: 1,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTab,
        child: Card(
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 16,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            height: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 99,
                  width: 66,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(parcel.parcelSizeImage),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 38,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyCustomText(
                      fontSize: screenSize * 0.04,
                      text: parcel.parcelSize,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: screenSize * 0.03,
                    ),
                    MyCustomText(
                      text: parcel.parcelSizeDimension,
                      textColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MyCustomText(
                      text: parcel.parcelSizeDescription,
                      textColor: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

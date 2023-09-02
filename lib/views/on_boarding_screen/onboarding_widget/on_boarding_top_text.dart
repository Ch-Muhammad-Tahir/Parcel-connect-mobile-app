import 'package:flutter/material.dart';
import '../../../utils/media_query.dart';

import '../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class OnBoardingTopText extends StatelessWidget {
  final Color textColor;
  const OnBoardingTopText({super.key, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: GetScreenSize.getScreenWidth(context) * 0.03),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomText(
            text: AppStrings.deliveryApp,
            color: textColor,
            size: 25,
            maxline: 1,
            fontWeight: FontWeight.w700),
        Divider(
          thickness: 1.5,
          color: textColor,
        ),
        CustomText(
            text: AppStrings.onboaringScreenText,
            color: textColor,
            size: 15,
            maxline: 2,
            fontWeight: FontWeight.w400)
      ]),
    );
  }
}

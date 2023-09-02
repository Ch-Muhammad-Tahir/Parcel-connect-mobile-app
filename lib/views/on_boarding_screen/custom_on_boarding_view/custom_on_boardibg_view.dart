import 'package:flutter/material.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/media_query.dart';
import '../../../views/on_boarding_screen/onboarding_widget/on_boarding_top_text.dart';
import '../../../widgets/custom_text.dart';

class CustomOnBoaringViewWidget extends StatefulWidget {
  final String topShapeImage;
  final String centerImage;
  final String title;
  final String discriptions;

  final bool showBlueText;
  final bool showTopContainer;
  final bool showWhiteText;

  const CustomOnBoaringViewWidget(
      {super.key,
      required this.topShapeImage,
      required this.centerImage,
      required this.showBlueText,
      required this.title,
      required this.discriptions,
      required this.showWhiteText,
      required this.showTopContainer});

  @override
  State<CustomOnBoaringViewWidget> createState() =>
      _CustomOnBoaringViewWidgetState();
}

class _CustomOnBoaringViewWidgetState extends State<CustomOnBoaringViewWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = GetScreenSize.getScreenWidth(context);
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          SizedBox(
            width: GetScreenSize.getScreenWidth(context),
            child: Stack(
              children: [
                if (widget.showTopContainer)
                  Container(
                    height: screenWidth * 0.7,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        //color: Colors.amber,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(widget.topShapeImage))),
                  ),
                if (widget.showBlueText)
                  Image.asset(
                    AppAssets.shape2,
                  ),
                if (widget.showWhiteText)
                  Positioned(
                    width: screenWidth * 0.63,
                    bottom: 110,
                    left: 10,
                    child: const OnBoardingTopText(textColor: Colors.white),
                  )
              ],
            ),
          ),
          if (widget.showBlueText)
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  width: screenWidth * 0.7,
                  child: const OnBoardingTopText(textColor: Colors.blue)),
            ),
          const Expanded(child: SizedBox()),
          Image.asset(
            widget.centerImage,
            height: screenWidth * 0.6,
            width: screenWidth * 0.6,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
              text: widget.title,
              color: Colors.black,
              size: screenWidth * 0.07,
              maxline: 1,
              fontWeight: FontWeight.w700),
          CustomText(
              text: widget.discriptions,
              color: Colors.black,
              size: screenWidth * 0.04,
              maxline: 4,
              align: TextAlign.center,
              fontWeight: FontWeight.w300),
          const Expanded(child: SizedBox()),
        ]),
      ),
    );
  }
}

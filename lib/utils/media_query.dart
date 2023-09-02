import 'package:flutter/material.dart';

class GetScreenSize {
  // final Widget mobile;
  // final Widget tablet;
  // final Widget desktop;
  // const GetScreenSize({
  //   Key? key,
  //   required this.desktop,
  //   required this.mobile,
  //   required this.tablet,
  // }) ;
  // static bool isMobile(BuildContext context) =>
  //     MediaQuery.of(context).size.width < 650;

  // /// tablet >= 650
  // static bool isTablet(BuildContext context) =>
  //     MediaQuery.of(context).size.width >= 650;

  // ///desktop >= 1100
  // static bool isDesktop(BuildContext context) =>
  //     MediaQuery.of(context).size.width >= 1100;

  static Size getScreenSize(BuildContext context) {
    // if (MediaQuery.of(context).size.width > 1000) {
    //   return MediaQuery.of(context).size / 3;
    // } else if (MediaQuery.of(context).size.width > 500 &&
    //     MediaQuery.of(context).size.width < 1000) {
    //   return MediaQuery.of(context).size / 2;
    // }
    return MediaQuery.of(context).size;
  }

  static double getScreenWidth(BuildContext context) {
    if (MediaQuery.sizeOf(context).width > 1200) {
      return MediaQuery.sizeOf(context).width / 3;
    }
    if (MediaQuery.sizeOf(context).width > 500 &&
        MediaQuery.sizeOf(context).width <= 1200) {
      return MediaQuery.sizeOf(context).width / 2;
    }
    return MediaQuery.sizeOf(context).width;
  }

  static double getScreenHeight(BuildContext context) {
    if (MediaQuery.sizeOf(context).height > 1200) {
      return MediaQuery.sizeOf(context).height / 3;
    }
    if (MediaQuery.sizeOf(context).height > 500 &&
        MediaQuery.sizeOf(context).height < 800) {
      return MediaQuery.sizeOf(context).height / 2;
    }
    return MediaQuery.of(context).size.height;
  }

  static Orientation getScreenOrienation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }
}

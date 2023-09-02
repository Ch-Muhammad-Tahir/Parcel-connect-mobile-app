import 'package:flutter/material.dart';

import 'custom_sized_box.dart';

class CustomTextButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? icon;
  final bool addIcon;
  final String buttonText;
  final Color buttonColor;
  final Color fontColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback onTab;
  final double radius;
  final double? fontSize;
  const CustomTextButton(
      {super.key,
      this.height,
      this.width,
      this.icon,
      required this.onTab,
      required this.buttonText,
      required this.buttonColor,
      required this.radius,
      this.addIcon = false,
      required this.fontSize,
      this.fontColor = Colors.white,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      color: buttonColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTab,
        child: Container(
          padding: padding,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(radius)),
          height: height,
          width: width,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (addIcon) icon!,
                if (addIcon)
                  const CustomSizedBox(
                    width: 10,
                  ),
                Text(
                  textAlign: TextAlign.center,
                  buttonText,
                  style: TextStyle(color: fontColor, fontSize: fontSize),
                )
              ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String text;
  final Color color;
  final double size;
  final int maxline;
  final TextAlign? align;
  final FontWeight fontWeight;
  const CustomText(
      {super.key,
      required this.text,
      required this.color,
      required this.size,
      required this.maxline,
      required this.fontWeight,
      this.align});
  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: widget.align,
      widget.text,
      maxLines: widget.maxline,
      softWrap: true, // Enable line wrapping
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: widget.color,
        fontSize: widget.size,
        fontWeight: widget.fontWeight,
      ),
    );
    //
  }
}

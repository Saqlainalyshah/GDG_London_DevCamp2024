import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  const TextWidget({
    Key? key,
    required this.text,
    this.fontSize = 11,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final textScaleFactor = mediaQuery.textScaleFactor;

    // Adjust the font size based on the user's preferred font size settings
    final adjustedFontSize = fontSize * textScaleFactor;

    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: 5,
      style: TextStyle(
        color: color,
        fontSize: adjustedFontSize,
        letterSpacing: 0.5,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
    );
  }
}

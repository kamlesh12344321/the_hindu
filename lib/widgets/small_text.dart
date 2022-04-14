import 'package:flutter/material.dart';

class SamllText extends StatelessWidget {
  final String text;
  double? size = 14;
  final FontWeight fontWeight;
  Color? color = Colors.black12;
  double? wordSpacing = 2.0;

  SamllText(
      this.text, this.size, this.fontWeight, this.color, this.wordSpacing);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        wordSpacing: wordSpacing,
      ),
    );
  }
}

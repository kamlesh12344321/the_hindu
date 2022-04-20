import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  double? size = 20;
  Color? color = Colors.black12;
  double? wordSpacing = 2.0;

  BigText(this.size, this.color, this.wordSpacing, this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        wordSpacing: wordSpacing,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 4,
    );
  }
}

import 'package:flutter/material.dart';

class FullWidthImageItem extends StatefulWidget {
  const FullWidthImageItem({Key? key}) : super(key: key);

  @override
  State<FullWidthImageItem> createState() => _FullWidthImageItemState();
}

class _FullWidthImageItemState extends State<FullWidthImageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: new NetworkImage("https://www.thehindu.com/news/national/fsb6vw/article65331076.ece/alternates/FREE_1200/3500.jpeg")
        )
      ),
    );
  }
}

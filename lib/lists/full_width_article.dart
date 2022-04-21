import 'package:flutter/material.dart';

import '../widgets/big_text.dart';

class FullWidthImageItem extends StatefulWidget {
  final String? articleTitle;
  final String? articleImageUrl;
  FullWidthImageItem({required this.articleTitle, required this.articleImageUrl});

  @override
  State<FullWidthImageItem> createState() => _FullWidthImageItemState();
}

class _FullWidthImageItemState extends State<FullWidthImageItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 10,bottom: 10),
      alignment: AlignmentDirectional.bottomStart,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: BigText(20,Colors.white,1,widget.articleTitle!),
      ),
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(widget.articleImageUrl!)
          )
      ),
    );
  }
}

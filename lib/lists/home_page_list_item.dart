import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:the_hindu/widgets/big_text.dart';
import 'package:the_hindu/widgets/small_text.dart';

class HomePageListItem extends StatefulWidget {
  final String? articleTitle;
  final String? articleImageUrl;
  const HomePageListItem({Key? key,required this. articleTitle, required this. articleImageUrl}) : super(key: key);

  @override
  State<HomePageListItem> createState() => _HomePageListItemState();
}

class _HomePageListItemState extends State<HomePageListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.articleImageUrl ?? ""))),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(18, Colors.black, 1, widget.articleTitle ?? ""),
                Row(
                  children: [
                    Row(
                      children: [
                        SmallText("National", 14, Colors.grey, 1.0),
                        SmallText("Time", 14, Colors.grey, 1.0),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.add_moderator),
                        Icon(Icons.share),
                      ],
                    )

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

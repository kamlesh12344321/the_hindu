
import 'package:flutter/material.dart';
import 'package:the_hindu/networking/utils/section_constants.dart';
import 'package:the_hindu/widgets/big_text.dart';
import 'package:the_hindu/widgets/small_icon_article.dart';
import 'package:the_hindu/widgets/small_text.dart';

import '../networking/models/sport_stars.dart';

class SportPageListItem extends StatefulWidget {
  final Sports? sports;
  const SportPageListItem({Key? key,required this. sports}) : super(key: key);

  @override
  State<SportPageListItem> createState() => _SportPageListItemState();
}

class _SportPageListItemState extends State<SportPageListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 112,
      margin: const EdgeInsets.only(top: 12,bottom: 12,right: 16,left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 139,
              height: 112,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.sports?.imgUrl ?? PLACE_HOLDER))),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(16, Colors.black, 1, widget.sports?.title ?? ""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SmallText("SPORTSTAR .  ", 12, Colors.redAccent, 1.0),
                        SmallText("IPL 2022  ", 12, Colors.black, 1.0),
                      ],
                    ),
                    Row(
                      children: [
                        SmallIconArticle("assets/images/share.png",18.0,17.0),
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



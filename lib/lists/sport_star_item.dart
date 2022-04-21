import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:the_hindu/lists/home_page_list_item.dart';
import 'package:the_hindu/utils/CustomColors.dart';
import 'package:the_hindu/utils/SportStars.dart';

class SportStarItem extends StatefulWidget {
  List<SportStars>? data;

  SportStarItem({required this.data});

  @override
  State<SportStarItem> createState() => _SportStarItemState();
}

class _SportStarItemState extends State<SportStarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,bottom: 10,left: 16,right: 16),
      color: CustomColors.topPicksSection,
      child: Column(
          children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "STARSPORT",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
            child: ListView.builder(
          physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.data?.length,
            itemBuilder: (context, index) {
          return HomePageListItem(
              articleTitle: widget.data?[index].title ?? "",
              articleImageUrl: widget.data?[index].imageUrl ?? "");
        })),
      ]),
    );
  }
}

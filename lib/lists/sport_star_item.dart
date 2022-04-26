
import 'package:flutter/material.dart';
import 'package:the_hindu/lists/home_page_list_item.dart';
import 'package:the_hindu/lists/sport_star_list_item.dart';
import 'package:the_hindu/utils/CustomColors.dart';
import 'package:the_hindu/utils/SportStars.dart';

class sportStarItem extends StatefulWidget {
  List<SportStars>? data;

  sportStarItem({Key? key, required this.data}) : super(key: key);

  @override
  State<sportStarItem> createState() => _sportStarItemState();
}

class _sportStarItemState extends State<sportStarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10,bottom: 10,left: 16,right: 16),
      color: CustomColors.topPicksSection,
      child: Column(
          children: [
        Center(
          child: Container(
            height: 20,
            width: 106,
            margin: const EdgeInsets.only(top: 16),
            child: Image.asset('assets/images/sportstar.png')
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
          physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.data?.length,
            itemBuilder: (context, index) {
          return SportPageListItem(
              articleTitle: widget.data?[index].title ?? "",
              articleImageUrl: widget.data?[index].imageUrl ?? "");
        })),
      ]),
    );
  }
}

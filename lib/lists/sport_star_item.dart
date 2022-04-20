import 'package:flutter/material.dart';
import 'package:the_hindu/lists/home_page_list_item.dart';
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
      child: Column(children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "StarSport",
          ),
        ),
        Container(child: ListView.builder(itemBuilder: (context, index) {
          return HomePageListItem(
              articleTitle: widget.data?[index].title ?? "",
              articleImageUrl: widget.data?[index].imageUrl ?? "");
        })),
      ]),
    );
  }
}

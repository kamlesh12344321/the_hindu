import 'package:flutter/material.dart';
import 'package:the_hindu/utils/CustomColors.dart';
import 'package:the_hindu/utils/top_picks.dart';

class TopPicksView extends StatefulWidget {
  List<TopPicks>? data;

  TopPicksView({required this.data});

  @override
  State<TopPicksView> createState() => _TopPicksViewState();
}

class _TopPicksViewState extends State<TopPicksView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 210,
        color: CustomColors.topPicksSection,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.data?.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 15, bottom: 10, left: 16, right: 10),
              width: 140,
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 140,
                      height: 140,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  widget.data?[index].imageUrl ?? ""))),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data?[index].title ?? "",
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}

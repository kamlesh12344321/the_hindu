import 'package:flutter/material.dart';
import 'package:the_hindu/utils/CustomColors.dart';
import 'package:the_hindu/utils/top_picks.dart';

class TopPicksView extends StatefulWidget {
  List<TopPicks>? data;

  TopPicksView({Key? key, required this.data}) : super(key: key);

  @override
  State<TopPicksView> createState() => _TopPicksViewState();
}

class _TopPicksViewState extends State<TopPicksView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 210,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.data?.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10, left: 16, right: 10),
              width: 149,
              height: 112,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 149,
                      height: 112,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  widget.data?[index].imageUrl ?? ""))),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 5,left: 4),
                        child: Text(
                          widget.data?[index].title ?? "",
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                          fontFamily: "FiraSans"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}

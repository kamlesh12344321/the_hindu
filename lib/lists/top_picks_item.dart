
import 'package:flutter/material.dart';
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
      height: 300,
      color: Colors.black12,
        child: ListView.builder(
          shrinkWrap:  true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.data?.length,
          itemBuilder: (context,index){
            return Container(
              width: 200,
              height: 200,
              child: Column(
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
                              image: NetworkImage(widget.data?[index].imageUrl ?? ""))),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data?[index].title ?? ""
                    ),
                  )
                ],
              ),
            );
          },
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:the_hindu/utils/AllSports.dart';
class allSportsViewItem extends StatefulWidget {
  final Iterable<Welcome>? mapData;

  const allSportsViewItem({Key? key,  required this.mapData}) : super(key: key);

  @override
  State<allSportsViewItem> createState() => _allSportsViewItemState();
}

class _allSportsViewItemState extends State<allSportsViewItem> {
  @override
  Widget build(BuildContext context) {
    if(widget.mapData != null) {
    }
    return Container();
  }
}



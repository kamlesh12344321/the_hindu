import 'package:flutter/material.dart';
import 'package:the_hindu/lists/sport_star_list_item.dart';
import 'package:the_hindu/networking/models/sport_stars.dart';
import 'package:the_hindu/utils/CustomColors.dart';

import '../article_detail.dart';
import '../networking/utils/section_constants.dart';

class sportStarItem extends StatefulWidget {
  List<Sports>? data;

  sportStarItem({Key? key, required this.data}) : super(key: key);

  @override
  State<sportStarItem> createState() => _sportStarItemState();
}

class _sportStarItemState extends State<sportStarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      color: CustomColors.topPicksSection,
      child: Column(
        children: [
          Center(
            child: Container(
                height: 20,
                width: 106,
                margin: const EdgeInsets.only(top: 16),
                child: Image.asset('assets/images/sportstar.png')),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    final Sports? sports = widget.data?[index];
                    _sendDataToSecondScreen(context, sports?.description);
                  },
                  child: SportPageListItem(
                    sports: widget.data?[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _sendDataToSecondScreen(BuildContext context, String? des) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticleDetail(
            description: des,
          ),
        ));
  }
}

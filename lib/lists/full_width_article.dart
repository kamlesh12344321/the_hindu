import 'package:flutter/material.dart';
import 'package:the_hindu/networking/utils/section_constants.dart';

import '../networking/models/article_list.dart';
import '../widgets/big_text.dart';

class FullWidthImageItem extends StatefulWidget {
  final Article? article;


  FullWidthImageItem(this.article);

  @override
  State<FullWidthImageItem> createState() => _FullWidthImageItemState();
}

class _FullWidthImageItemState extends State<FullWidthImageItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 10,bottom: 10),
      alignment: AlignmentDirectional.bottomStart,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BigText(16,Colors.white,1,widget.article?.title ?? ""),
      ),
      height: 295,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.article?.imgUrl ?? PLACE_HOLDER)
          )
      ),
    );
  }
}

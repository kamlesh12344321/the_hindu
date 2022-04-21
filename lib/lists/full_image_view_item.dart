import 'package:flutter/material.dart';
import 'package:the_hindu/lists/full_width_article.dart';
import 'package:the_hindu/widgets/big_text.dart';

class FullImageViewItem extends StatefulWidget {
 final String? articleTitle;
 final String? articleImageUrl;

  FullImageViewItem({required this. articleTitle, required this. articleImageUrl});

  @override
  State<FullImageViewItem> createState() => _FullImageViewItemState();

}

class _FullImageViewItemState extends State<FullImageViewItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 10.0),
      alignment: AlignmentDirectional.bottomStart,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: BigText(20,Colors.white,1,widget.articleTitle!),
      ),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.articleImageUrl!)
        )
      ),
    );
  }
}

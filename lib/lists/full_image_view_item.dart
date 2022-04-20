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
      margin: EdgeInsets.all(16),
      alignment: AlignmentDirectional.bottomStart,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: BigText(20,Colors.white,1,widget.articleTitle!),
      ),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.articleImageUrl!)
        )
      ),
    );
  }
}

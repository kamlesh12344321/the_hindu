import 'package:flutter/material.dart';
import 'package:the_hindu/networking/utils/section_constants.dart';

class FullImageViewItem extends StatefulWidget {
 final String? articleTitle;
 final String? articleImageUrl;

  const FullImageViewItem({Key? key, this. articleTitle,  this. articleImageUrl}) : super(key: key);

  @override
  State<FullImageViewItem> createState() => _FullImageViewItemState();

}

class _FullImageViewItemState extends State<FullImageViewItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 10.0),
      alignment: AlignmentDirectional.bottomStart,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          widget.articleTitle ?? "",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily:"Fira Sans"
          ),
        ),
      ),
      height: 236,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.articleImageUrl ?? PLACE_HOLDER)
        )
      ),
    );
  }
}

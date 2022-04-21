import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_hindu/widgets/common_toolbar.dart';

class ArticleDetail extends StatefulWidget {
  final String? description;


  ArticleDetail({required this.description});

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonToolbar("Article Detail"),
      body: Container(
        child: Text(widget.description ?? "",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
      )
    );
  }
}

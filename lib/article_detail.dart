import 'package:flutter/material.dart';
import 'package:the_hindu/widgets/common_toolbar.dart';

class ArticleDetail extends StatefulWidget {
  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonToolbar("Article Detail"),
      body: Container(
        color: Colors.blue,
      )
    );
  }
}

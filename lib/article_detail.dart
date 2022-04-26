import 'package:flutter/material.dart';
import 'package:the_hindu/widgets/common_toolbar.dart';

class ArticleDetail extends StatefulWidget {
  final String? description;


  const ArticleDetail({Key? key, required this.description}) : super(key: key);

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonToolbar("Article Detail"),
      body: Text(widget.description ?? "",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),)
    );
  }
}

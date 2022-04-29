import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
      body: SingleChildScrollView(
        child: Html(
          data: widget.description,
        ),
      )
    );
  }
}

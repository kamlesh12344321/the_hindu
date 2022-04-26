import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_hindu/utils/article_data.dart';
import 'package:http/http.dart' as http;

class PremiumPage extends StatefulWidget {


  @override
  State<PremiumPage> createState() => _PremiumPageState();
}


class _PremiumPageState extends State<PremiumPage> {
   Future<Welcome>? futureArticles;


  @override
  void initState() {
    futureArticles = fetchArticle();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Welcome>(
      future: futureArticles,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Text(snapshot.data!.status.toString());
        } else if(snapshot.hasError){
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

Future<Welcome> fetchArticle() async {

  final response = await http.get(Uri.parse('http://192.168.12.169/projects/Hindu/mvp/project-root/public/api/articles'));

  if (response.statusCode == 200) {
// If the server did return a 200 OK response,
// then parse the JSON.
    return Welcome.fromJson(jsonDecode(response.body));
  } else {
// If the server did not return a 200 OK response,
// then throw an exception.
    throw Exception('Failed to load album');
  }
}

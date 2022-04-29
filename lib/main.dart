import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_hindu/networking/view_models/Article_list_view_model.dart';
import 'package:the_hindu/networking/view_models/sport_stars_view_model.dart';
import 'package:the_hindu/widgets/bottom_navigation_bar.dart';

import 'networking/view_models/sections_list_view_model.dart';

void main() {
  runApp(const TheHinduApp());
}

class TheHinduApp extends StatefulWidget {
  const TheHinduApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TheHinduState();
  }
}

class _TheHinduState extends State<TheHinduApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SectionsViewModel()),
          ChangeNotifierProvider(create: (_) => ArticleListViewModel()),
          ChangeNotifierProvider(create: (_) => SportStarsViewModel()),
        ],
    child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "FiraSans",
        ),
        home: TheHinduBottomNav()
    ),);
  }
}

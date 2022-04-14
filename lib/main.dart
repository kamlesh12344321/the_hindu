import 'package:flutter/material.dart';
import 'package:the_hindu/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(TheHinduApp());
}

class TheHinduApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TheHinduState();
  }
}

class _TheHinduState extends State<TheHinduApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TheHinduBottomNav()
    );
  }
}

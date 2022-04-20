import 'package:flutter/material.dart';

class SubscribeUserTemplate extends StatefulWidget {
  const SubscribeUserTemplate({Key? key}) : super(key: key);

  @override
  State<SubscribeUserTemplate> createState() => _SubscribeUserTemplateState();
}

class _SubscribeUserTemplateState extends State<SubscribeUserTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Center(
        child: Text(
          "Subscribe User",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

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
      margin: const EdgeInsets.only(top: 10,bottom: 10),
      width: 300,
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: const Center(
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

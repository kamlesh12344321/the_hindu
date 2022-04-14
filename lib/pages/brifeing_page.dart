import 'package:flutter/material.dart';

class BriefingPage extends StatefulWidget {
  const BriefingPage({Key? key}) : super(key: key);

  @override
  State<BriefingPage> createState() => _BriefingPageState();
}

class _BriefingPageState extends State<BriefingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Text("Briefing"),
      ),
    );
  }
}

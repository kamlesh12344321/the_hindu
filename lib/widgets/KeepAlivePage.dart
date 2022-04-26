import 'package:flutter/material.dart';

class keepAlivePage extends StatefulWidget {
  const keepAlivePage({
    required Key key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _keepAlivePageState createState() => _keepAlivePageState();
}

class _keepAlivePageState extends State<keepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    /// Dont't forget this
    super.build(context);

    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
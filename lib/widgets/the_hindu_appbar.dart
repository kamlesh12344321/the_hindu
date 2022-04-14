import 'package:flutter/material.dart';
import 'package:the_hindu/article_detail.dart';

class TheHinduAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Image.asset(
          "assets/images/left_slider_three_line.png",
          fit: BoxFit.cover,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_actionbar.png',
            fit: BoxFit.fill,
            height: 23,
            width: 190,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Image.asset('assets/images/crown_v90.png'),
          iconSize: 12,
          padding: EdgeInsets.only(right: 16),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ArticleDetail()));
          },
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}

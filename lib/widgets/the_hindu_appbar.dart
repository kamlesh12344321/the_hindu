import 'package:flutter/material.dart';

class TheHinduAppBar extends StatelessWidget with PreferredSizeWidget {
  const TheHinduAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 64,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Image.asset(
          "assets/images/ham.png",
          fit: BoxFit.cover,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_actionbar.png',
            fit: BoxFit.cover,
            height: 23,
            width: 190,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Image.asset('assets/images/crown_v90.png'),
          iconSize: 12,
          padding: const EdgeInsets.only(right: 16),
          onPressed: () {

          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

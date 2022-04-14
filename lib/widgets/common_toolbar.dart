import 'package:flutter/material.dart';
import 'package:the_hindu/widgets/big_text.dart';

class CommonToolbar extends StatelessWidget with PreferredSizeWidget {
  var title;
  CommonToolbar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;

  CustomAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

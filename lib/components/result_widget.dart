import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool won;
  final Function onRestart;

  ResultWidget({this.won, this.onRestart});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}

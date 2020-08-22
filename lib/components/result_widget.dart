import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool won;
  final Function onRestart;
  final int qtyBombs;

  ///Constructor
  ResultWidget(
      {@required this.won, @required this.onRestart, @required this.qtyBombs});

  get _getQtyBombs => qtyBombs;

  Color _getColor() {
    if (won == null) {
      return Colors.yellow;
    } else if (won) {
      return Colors.green.shade300;
    } else {
      return Colors.red.shade300;
    }
  }

  IconData _getIcon() {
    if (won == null) {
      return Icons.sentiment_satisfied;
    } else if (won) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.flag,
                        color: Colors.red.shade900,
                        size: 35,
                      ),
                      onPressed: null),
                  Text(
                    '$_getQtyBombs',
                    style: TextStyle(
                      fontFamily: 'roboto',
                      color: Colors.red.shade900,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              CircleAvatar(
                backgroundColor: _getColor(),
                child: IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(
                    _getIcon(),
                    color: Colors.black,
                    size: 35,
                  ),
                  onPressed: onRestart,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}

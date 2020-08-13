import 'package:flutter/material.dart';
import 'package:minesweeper/components/result_widget.dart';

class MinesweeperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(),
        body: Container(child: Text('Board')),
      ),
    );
  }
}

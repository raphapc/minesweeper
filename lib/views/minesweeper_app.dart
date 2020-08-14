import 'package:flutter/material.dart';
import 'package:minesweeper/components/field_widget.dart';
import 'package:minesweeper/components/result_widget.dart';
import 'package:minesweeper/models/field.dart';

class MinesweeperApp extends StatelessWidget {
  _restart() {}
  _open() {}
  _changeFlag() {}

  @override
  Widget build(BuildContext context) {
    Field field = Field(column: 0, line: 0);
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: null,
          onRestart: _restart(),
        ),
        body: Container(
            child: FieldWidget(
          field: field,
          onOpen: _open(),
          onChangeFlag: _changeFlag(),
        )),
      ),
    );
  }
}

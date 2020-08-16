import 'package:flutter/material.dart';
import 'package:minesweeper/components/board_widget.dart';
import 'package:minesweeper/components/result_widget.dart';
import 'package:minesweeper/models/board.dart';
import 'package:minesweeper/models/explosion_exception.dart';
import 'package:minesweeper/models/field.dart';

class MinesweeperApp extends StatefulWidget {
  @override
  _MinesweeperAppState createState() => _MinesweeperAppState();
}

class _MinesweeperAppState extends State<MinesweeperApp> {
  bool _won;
  Board _board;

  _restart() {
    setState(() {
      _won = null;
      _board.restart();
    });
  }

  _open(Field field) {
    if (_won != null) return;
    setState(() {
      try {
        field.open();
        if (_board.resolved) {
          _won = true;
        }
      } on ExplosionException {
        _won = false;
        _board.showBombs();
      }
    });
  }

  _changeFlag(Field field) {
    if (_won != null) return;
    setState(() {
      field.changeFlag();
      if (_board.resolved) {
        _won = true;
      }
    });
  }

  Board _getBoard(double width, double height) {
    if (_board == null) {
      int qtyColumns = 15;
      double sizeField = width / qtyColumns;
      int qtyLines = (height / sizeField).floor();

      _board = Board(
        lines: qtyLines,
        columns: qtyColumns,
        qtyBombs: 3,
      );
    }
    return _board;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: _won,
          onRestart: _restart,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(builder: (ctx, constraints) {
            return BoardWidget(
              board: _getBoard(
                constraints.maxWidth,
                constraints.maxHeight,
              ),
              onOpen: _open,
              onChangeFlag: _changeFlag,
            );
          }),
        ),
      ),
    );
  }
}

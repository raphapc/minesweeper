import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:minesweeper/models/field.dart';

class Board {
  final int lines;
  final int columns;
  final int qtyBombs;

  final List<Field> _fields = [];

  Board(
      {@required this.lines, @required this.columns, @required this.qtyBombs}) {
    _createFields();
    _linkNeighbors();
    _drawMines();
  }

  /// Restart the game and draw new mines
  void restart() {
    _fields.forEach((f) => f.restart());
    _drawMines();
  }

  void showBombs() {
    _fields.forEach((f) => f.showBombs());
  }

  List<Field> get fields => _fields;

  bool get resolved {
    return _fields.every((f) => f.resolved);
  }

  void _createFields() {
    for (int l = 0; l < lines; l++) {
      for (int c = 0; c < columns; c++) {
        _fields.add(Field(line: l, column: c));
      }
    }
  }

  void _linkNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }

  /// Draw the mines until you get to the quantity of bombs expected
  void _drawMines() {
    int mines = 0;
    // Guard clause
    if (qtyBombs > lines * columns) {
      return; //TODO throw exception
    }
    while (mines < qtyBombs) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].mined) {
        mines++;
        _fields[i].mine();
      }
    }
  }
}

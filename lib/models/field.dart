import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:minesweeper/models/explosion_exception.dart';

/// Class for the field
class Field {
  final int line;
  final int column;
  final List<Field> neighbors = [];

  bool _opened = false;
  bool _flagged = false;
  bool _mined = false;
  bool _exploded = false;

  ///Constructor
  Field({@required this.line, @required this.column});

  void addNeighbor(Field neighbor) {
    final deltaLine = (line - neighbor.line).abs();
    final deltaCol = (column - neighbor.column).abs();

    if (deltaLine == 0 && deltaCol == 0) return;

    if (deltaLine <= 1 && deltaCol <= 1) {
      neighbors.add(neighbor);
    }
  }

  void open() {
    if (_opened) return;
    _opened = true;

    if (_mined) {
      _exploded = true;
      throw ExplosionException();
    }

    if (isNeighborSafe) {
      neighbors.forEach((n) => n.open());
    }
  }

  void showBombs() {
    if (_mined) {
      _opened = true;
    }
  }

  void mine() {
    _mined = true;
  }

  void changeFlag() {
    _flagged = !_flagged;
  }

  void restart() {
    _opened = false;
    _flagged = false;
    _mined = false;
    _exploded = false;
  }

  bool get exploded => _exploded;

  bool get mined => _mined;

  bool get opened => _opened;

  bool get flagged => _flagged;

  bool get isNeighborSafe => neighbors.every((n) => !n.mined);

  bool get resolved {
    bool minedFlagged = mined && flagged;
    bool safeOpened = !mined && opened;
    return minedFlagged || safeOpened;
  }

  int get mineAmountNeighborhood {
    return neighbors.where((n) => n.mined).length;
  }
}

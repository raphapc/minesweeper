import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/board.dart';

main() {
  test('Win game', () {
    Board board = Board(lines: 2, columns: 2, qtyBombs: 0);
    board.fields[0].mine();
    board.fields[1].mine();

    // all conditions to win the game
    board.fields[0].changeFlag();
    board.fields[1].changeFlag();
    board.fields[2].open();
    board.fields[3].open();

    expect(board.resolved, isTrue);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/field.dart';

main() {
  group('Test field', () {
    test('Open field WITH explosion', () {
      Field f = Field(line: 0, column: 0);
      f.mine();

      expect(f.open, throwsException);
    });
    test('Open field WITHOUT explosion', () {
      Field f = Field(line: 0, column: 0);
      f.open();
      expect(f.opened, isTrue);
    });
    test('Add NON Neighbor', () {
      Field f1 = Field(line: 0, column: 0);
      Field f2 = Field(line: 1, column: 3);
      f1.addNeighbor(f2);

      expect(f1.neighbors.isEmpty, isTrue);
    });
    test('Add Neighbor', () {
      Field f1 = Field(line: 0, column: 0);
      Field f2 = Field(line: 1, column: 1);
      f1.addNeighbor(f2);

      expect(f1.neighbors.isNotEmpty, isTrue);
    });

    test('Amount of Neighbors mined', () {
      Field f1 = Field(line: 0, column: 0);
      Field f2 = Field(line: 1, column: 1);
      Field f3 = Field(line: 0, column: 1);
      f3.mine();
      Field f4 = Field(line: 1, column: 0);
      f4.mine();

      f1.addNeighbor(f2);
      f1.addNeighbor(f3);
      f1.addNeighbor(f4);

      expect(f1.mineAmountNeighborhood, 2);
    });
  });
}

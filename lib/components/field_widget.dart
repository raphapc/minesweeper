import 'package:flutter/material.dart';
import 'package:minesweeper/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onChangeFlag;

  ///Constructor
  FieldWidget(
      {@required this.field,
      @required this.onOpen,
      @required this.onChangeFlag});

  Widget _getImage() {
    if (field.opened && field.mined && field.exploded) {
      return Image.asset('assets/images/bomb_0.jpeg');
    } else if (field.opened && field.mined) {
      return Image.asset('assets/images/bomb_1.jpeg');
    } else if (field.opened) {
      return Image.asset(
          'assets/images/open_${field.mineAmountNeighborhood}.jpeg');
    } else if (field.flagged) {
      return Image.asset('assets/images/flag.jpeg');
    } else {
      return Image.asset('assets/images/closed.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onChangeFlag(field),
      child: _getImage(),
    );
  }
}

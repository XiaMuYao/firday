import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/styles.dart';

enum DeskButtonType {
  positive,
  negative,
  nature,
}

class DeskActionButton extends StatelessWidget {
  const DeskActionButton({
    super.key,
    required this.title,
    required this.deskButtonType,
  });

  final String title;
  final DeskButtonType deskButtonType;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    TextStyle textStyle = TextStyles.texBlack_16;
    BoxBorder? boxBorder;

    switch (deskButtonType) {
      case DeskButtonType.negative:
        color = Colours.negative;
        textStyle = TextStyles.texBlack_16;
        break;
      case DeskButtonType.positive:
        color = Colours.positive;
        textStyle = TextStyles.textWhite_16;
        break;
      case DeskButtonType.nature:
        color = Colours.nature;
        textStyle = TextStyles.texBlack_16;
        boxBorder = Border.all(color: Colours.lineGrey2, width: 1);
        break;
    }

    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          border: boxBorder),
      height: 40,
      width: 136,
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
    );
  }
}

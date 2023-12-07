import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

class TextStyles {
  static const TextStyle textWhite70_16 = TextStyle(
    inherit: false,
    fontSize: Dimens.font_sp16,
    color: Color(0xB3FFFFFF),
  );

  static const TextStyle textWhite_16 = TextStyle(
    inherit: false,
    fontSize: Dimens.font_sp16,
    color: Colors.white,
  );

  static const TextStyle texBlack_18 = TextStyle(
    inherit: false,
    fontSize: Dimens.font_sp18,
    color: Colours.textBlackColor,
  );

  static const TextStyle texBlack_16 = TextStyle(
    inherit: false,
    fontSize: Dimens.font_sp16,
    color: Colours.textBlueColor,
  );

  static const TextStyle textSize12 = TextStyle(
    fontSize: Dimens.font_sp12,
  );
  static const TextStyle textSize16 = TextStyle(
    fontSize: Dimens.font_sp16,
  );
  static const TextStyle textBold14 = TextStyle(fontSize: Dimens.font_sp14, fontWeight: FontWeight.bold);
  static const TextStyle textBold16 = TextStyle(fontSize: Dimens.font_sp16, fontWeight: FontWeight.bold);
  static const TextStyle textBold18 = TextStyle(fontSize: Dimens.font_sp18, fontWeight: FontWeight.bold);
  static const TextStyle textBold24 = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
  static const TextStyle textBold26 = TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold);

  static const TextStyle textGray14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_gray,
  );
  static const TextStyle textDarkGray14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.dark_text_gray,
  );

  static const TextStyle textWhite14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colors.white,
  );

  static const TextStyle text = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.text,
      // https://github.com/flutter/flutter/issues/40248
      textBaseline: TextBaseline.alphabetic);
  static const TextStyle textDark =
      TextStyle(fontSize: Dimens.font_sp14, color: Colours.dark_text, textBaseline: TextBaseline.alphabetic);

  static const TextStyle textGray12 =
      TextStyle(fontSize: Dimens.font_sp12, color: Colours.text_gray, fontWeight: FontWeight.normal);
  static const TextStyle textDarkGray12 =
      TextStyle(fontSize: Dimens.font_sp12, color: Colours.dark_text_gray, fontWeight: FontWeight.normal);

  static const TextStyle textHint14 = TextStyle(fontSize: Dimens.font_sp14, color: Colours.dark_unselected_item_color);
}

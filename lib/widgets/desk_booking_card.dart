import 'package:firday/res/colors.dart';
import 'package:firday/res/gaps.dart';
import 'package:firday/res/styles.dart';
import 'package:flutter/material.dart';

import 'desk_action_button.dart';

class DeskBookingCard extends StatelessWidget {
  const DeskBookingCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.deskActionPositiveType,
      required this.deskActionNegativeType});

  final String title;
  final String subTitle;
  final DeskButtonType deskActionPositiveType;
  final DeskButtonType deskActionNegativeType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        border: Border(
          top: BorderSide(color: Colours.fdPurple, width: 1),
          right: BorderSide(color: Colours.fdPurple, width: 1),
          bottom: BorderSide(color: Colours.fdPurple, width: 1),
          left: BorderSide(color: Colours.fdPurple, width: 6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 16),
            child: Text(
              title,
              style: TextStyles.textBold16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16),
            child: Text(
              subTitle,
              style: TextStyles.textHint14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gaps.hGap16,
                DeskActionButton(
                  key: const Key("deskActionPositive"),
                  title: "Get Directions",
                  deskButtonType: deskActionPositiveType,
                ),
                Gaps.hGap8,
                DeskActionButton(
                  key: const Key("deskActionNegative"),
                  title: "Check in",
                  deskButtonType: deskActionNegativeType,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

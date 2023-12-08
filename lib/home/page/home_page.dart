import 'package:firday/res/gaps.dart';
import 'package:firday/res/styles.dart';
import 'package:firday/widgets/desk_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../res/colors.dart';
import '../../widgets/desk_booking_card.dart';
import '../../widgets/meeting_booking_card.dart';
import '../../widgets/networking_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 显示状态栏和导航栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.fdBlue,
      appBar: const HomeAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            const Column(
              children: [
                SearchArea(),
                TimeSwitchBar(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 124),
              child: Scrollable(
                viewportBuilder: (BuildContext context, ViewportOffset position) {
                  return const SingleChildScrollView(
                    child: Column(
                      children: [
                        DeskBookingInformationCard(),
                        Gaps.v1Grey1Line,
                        MeetingBookingInformationCard(),
                        Gaps.v1Grey2Line,
                        NetWorkingInformationCard(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NetWorkingInformationCard extends StatefulWidget {
  const NetWorkingInformationCard({super.key});

  @override
  State<NetWorkingInformationCard> createState() => _NetWorkingInformationCardState();
}

class _NetWorkingInformationCardState extends State<NetWorkingInformationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.bg1,
      child: const Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15),
                child: Text(
                  "See who’s in Kingswood",
                  style: TextStyles.texBlack_18,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 15.0, right: 8),
                child: Text(
                  "Networking ",
                  style: TextStyles.texBlack_16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0, top: 15),
                child: FlutterLogo(size: 15),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 12, bottom: 24),
            child: NetWorkingCard(
              key: Key("homePageNetWorkingCard"),
            ),
          )
        ],
      ),
    );
  }
}

class MeetingBookingInformationCard extends StatefulWidget {
  const MeetingBookingInformationCard({super.key});

  @override
  State<MeetingBookingInformationCard> createState() => _MeetingBookingInformationCardState();
}

class _MeetingBookingInformationCardState extends State<MeetingBookingInformationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.bg1,
      child: const Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15),
                child: Text(
                  "Meeting",
                  style: TextStyles.texBlack_18,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 15.0, right: 8),
                child: Text(
                  "My Meetings",
                  style: TextStyles.texBlack_16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0, top: 15),
                child: FlutterLogo(size: 15),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 12, bottom: 24),
            child: MeetingBookingCard(
              key: Key("homePageMeetingBookingCard"),
            ),
          )
        ],
      ),
    );
  }
}

class DeskBookingInformationCard extends StatefulWidget {
  const DeskBookingInformationCard({super.key});

  @override
  State<DeskBookingInformationCard> createState() => _DeskBookingInformationCardState();
}

class _DeskBookingInformationCardState extends State<DeskBookingInformationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.bg1,
      child: const Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 15),
                child: Text(
                  "Desk",
                  style: TextStyles.texBlack_18,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 15.0, right: 8),
                child: Text(
                  "Desk Bookings",
                  style: TextStyles.texBlack_16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0, top: 15),
                child: FlutterLogo(size: 15),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 12, bottom: 24),
            child: DeskBookingCard(
              key: Key("homePageDeskBookingCard"),
              title: "All day booking - WMC00A-GE15",
              subTitle: "Ground floor (0), Windmill Court",
              deskActionPositiveType: DeskButtonType.positive,
              deskActionNegativeType: DeskButtonType.negative,
            ),
          )
        ],
      ),
    );
  }
}

class TimeSwitchBar extends StatefulWidget {
  const TimeSwitchBar({super.key});

  @override
  State<TimeSwitchBar> createState() => _TimeSwitchBarState();
}

class _TimeSwitchBarState extends State<TimeSwitchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.fdBlue1,
      width: double.infinity,
      height: 52,
      child: Row(children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Wed 1 Sep 2021 - In the Office",
            style: TextStyles.textWhite_16,
          ),
        ),
        Spacer(),
        Container(
          width: 1,
          color: Colours.fdBlue,
        ),
        FlutterLogo(size: 50),
        Container(
          width: 1,
          color: Colours.fdBlue,
        ),
        FlutterLogo(size: 50),
      ]),
    );
  }
}

class SearchArea extends StatelessWidget {
  const SearchArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.fdBlue,
      width: double.infinity,
      height: 72,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colours.fdBlue1,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: FlutterLogo(size: 15),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  "Search…",
                  style: TextStyles.textWhite70_16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.fdBlue,
      child: const SafeArea(
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            left: 20,
            child: FlutterLogo(size: 40),
          ),
          Positioned(
            width: 40,
            height: 40,
            child: FlutterLogo(size: 40),
          ),
          Positioned(
            right: 68,
            child: FlutterLogo(size: 22.5),
          ),
          Positioned(
            right: 20,
            child: FlutterLogo(size: 22.5),
          )
        ]),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}

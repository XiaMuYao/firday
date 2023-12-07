import 'package:firday/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../res/colors.dart';
import '../../widgets/desk_booking_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 显示状态栏和导航栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          HomeAppBar(),
          SearchArea(),
          TimeSwitchBar(),
          ListView(shrinkWrap: true, children: [
            const Text('I\'m dedicating every day to you'),
            const Text('Domestic life was never quite my style'),
            const Text('When you smile, you knock me out, I fall apart'),
            const Text('And I thought I was so smart'),
          ]),
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
      height: 200,
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

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colours.fdBlue,
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
    );
  }
}

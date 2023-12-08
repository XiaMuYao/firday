import 'package:flutter/material.dart';

import '../res/gaps.dart';

class MeetingBookingCard extends StatelessWidget {
  const MeetingBookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   shrinkWrap: true,
    //   padding: const EdgeInsets.all(20.0),
    //   children: <Widget>[
    //     const Text('I\'m dedicating every day to you'),
    //     const Text('Domestic life was never quite my style'),
    //     const Text('When you smile, you knock me out, I fall apart'),
    //     const Text('And I thought I was so smart'),
    //   ],
    // );
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
      ),
    );

    return Container(
      child: Column(
        children: [
          Container(
            height: 64,
            color: Colors.white,
          ),
          Gaps.vGap8,
          Container(
            height: 64,
            color: Colors.white,
          ),
          Gaps.vGap8,
          Container(
            height: 64,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

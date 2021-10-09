import 'package:flutter/material.dart';
import 'package:gospel_track/gospel_track/gospel_info.dart';
import 'package:gospel_track/gospel_track/gospel_track_page.dart';
import 'package:gospel_track/gospel_track/page_number.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class InfoGospelPage extends StatelessWidget {
  static const String route = 'info';

  const InfoGospelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GospelInfo info = context.watch<PageNumber>().getInfo();

    List<Widget> columnList = [
      Text(
        info.title,
        style: const TextStyle(fontSize: 32),
      ),
      const Divider()
    ];

    for (var desc in info.descriptions) {
      columnList.add(Card(
        child: Text(desc),
      ));
    }

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta != null && details.primaryDelta! > 9) {
          Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                  type: PageTransitionType.topToBottom,
                  child: const GospelTrackPage()),
              (route) => route.isFirst);
        }
      },
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta != null && details.primaryDelta! < -9) {
          context.read<PageNumber>().nextPage();
        } else if (details.primaryDelta != null && details.primaryDelta! > 9) {
          context.read<PageNumber>().lastPage();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: columnList,
            ),
          ),
        ),
      ),
    );
  }
}

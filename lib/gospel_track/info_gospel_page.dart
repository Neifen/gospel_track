import 'package:flutter/material.dart';
import 'package:gospel_track/gospel_track/gospel_track_page.dart';
import 'package:gospel_track/gospel_track/page_number.dart';
import 'package:provider/provider.dart';

class InfoGospelPage extends StatelessWidget {
  static const String route = 'info';

  const InfoGospelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentPage = context.watch<PageNumber>().currentPage;
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta != null && details.primaryDelta! > 9) {
          Navigator.pushNamedAndRemoveUntil(
              context, GospelTrackPage.route, (route) => route.isFirst);
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
          child: Column(
            children: [
              Text(
                  "Here we'll show some infos about gospel page #${_currentPage + 1}"),
              const Text("slide up to go back to your gospel page"),
              const Text("slide right to get to to the next page"),
              const Text("slide left to go to the last page")
            ],
          ),
        ),
      ),
    );
  }
}

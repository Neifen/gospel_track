import 'package:flutter/material.dart';
import 'package:gospel_track/gospel_track/gospel_info.dart';
import 'package:gospel_track/gospel_track/page_number.dart';
import 'package:provider/provider.dart';

class InfoGospelPage extends StatelessWidget {
  static const String route = 'info';

  const InfoGospelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GospelInfo info = context.watch<PageNumber>().getInfo();

    List<Widget> columnList = [
      Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 16),
        child: Text(
          info.title,
          style: const TextStyle(fontSize: 32),
        ),
      ),
    ];

    for (var desc in info.descriptions) {
      columnList.add(Padding(
        padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(desc),
          ),
        ),
      ));
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: columnList,
      ),
    );
  }
}

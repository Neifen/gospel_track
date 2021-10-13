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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: columnList,
        ),
      ),
    );
  }
}

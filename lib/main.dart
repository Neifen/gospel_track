import 'package:flutter/material.dart';
import 'package:gospel_track/gospel_track/gospel_track_page.dart';
import 'package:gospel_track/gospel_track/page_number.dart';
import 'package:gospel_track/gt_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(GospelTrackApp());
}

class GospelTrackApp extends StatelessWidget {
  final GtRouter _router = GtRouter();
  GospelTrackApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageNumber>(create: (_) => PageNumber()),
      ],
      child: MaterialApp(
        title: 'Gospel Track',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        navigatorObservers: [_router.routeObserver],
        onGenerateRoute: _router.getRoute,
        home: const GospelTrackPage(),
      ),
    );
  }
}

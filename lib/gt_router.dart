import 'package:flutter/material.dart';
import 'package:gospel_track/gospel_track/gospel_track_page.dart';
import 'package:gospel_track/gospel_track/info_gospel_page.dart';

class GtRouter {
  final RouteObserver<PageRoute> routeObserver;
  GtRouter() : routeObserver = RouteObserver<PageRoute>();

  MaterialPageRoute getRoute(RouteSettings settings) {
    switch (settings.name) {
      case GospelTrackPage.route:
        return _buildRoute(settings, const GospelTrackPage());
      case InfoGospelPage.route:
        return _buildRoute(settings, const InfoGospelPage());
      default:
        return _buildRoute(settings, const GospelTrackPage());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}

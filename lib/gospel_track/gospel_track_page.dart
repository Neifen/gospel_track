import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gospel_track/gospel_track/info_gospel_page.dart';
import 'package:gospel_track/gospel_track/page_number.dart';
import 'package:provider/provider.dart';

class GospelTrackPage extends StatelessWidget {
  static const List<String> _imgList = [
    'pictures/crappy/1_5finger.jpg',
    'pictures/crappy/2_5finger.jpg',
    'pictures/crappy/3_5finger.jpg',
    'pictures/crappy/4_5finger.jpg',
    'pictures/crappy/5_5finger.jpg'
  ];
  static const String route = 'gospel';

  const GospelTrackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      for (var imageUrl in _imgList) {
        precacheImage(AssetImage(imageUrl), context);
      }
    });

    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta != null && details.primaryDelta! < -9) {
            Navigator.pushNamed(context, InfoGospelPage.route);
          }
        },
        child: CarouselSlider(
          options: CarouselOptions(
              initialPage: context.read<PageNumber>().currentPage,
              enableInfiniteScroll: false,
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, _) =>
                  context.read<PageNumber>().currentPage = index),
          items: _imgList
              .map((item) => Container(
                  color: Colors.white,
                  child: Center(
                      child: Image.asset(
                    item,
                    fit: BoxFit.fitWidth,
                    height: height,
                  ))))
              .toList(),
        ),
      ),
    );
  }
}

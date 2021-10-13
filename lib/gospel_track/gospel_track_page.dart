import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gospel_track/gospel_track/info_gospel_page.dart';
import 'package:gospel_track/gospel_track/page_number.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class GospelTrackPage extends StatefulWidget {
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
  State<GospelTrackPage> createState() => _GospelTrackPageState();
}

class _GospelTrackPageState extends State<GospelTrackPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      for (var imageUrl in GospelTrackPage._imgList) {
        precacheImage(AssetImage(imageUrl), context);
      }
    });

    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity != null) {
            changeInfoHeight(details.primaryVelocity!);
          }
        },
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta != null) {
            prepareInfoHeight(details.primaryDelta!);
          }
        },
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  initialPage: context.read<PageNumber>().currentPage,
                  enableInfiniteScroll: false,
                  height: height,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onScrolled: (_) {},
                  onPageChanged: (index, _) {
                    return context.read<PageNumber>().changePage(index);
                  }),
              items: GospelTrackPage._imgList
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  height: _infoHeight,
                  child: const InfoGospelPage(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  var _infoHeight = 0.0;
  var _heightOnTouchUp = 0.0;
  changeInfoHeight(double primaryVelocity) {
    const minHeight = 0.0;
    final maxHeight = MediaQuery.of(context).size.height;
    setState(() {
      if (primaryVelocity < -800) {
        _infoHeight = maxHeight;
        return;
      } else if (primaryVelocity > 800) {
        _infoHeight = minHeight;
        return;
      }
      _infoHeight = _heightOnTouchUp;
    });
  }

  prepareInfoHeight(double delta) {
    const minHeight = 0.0;
    final maxHeight = MediaQuery.of(context).size.height;
    final upThreshhold = MediaQuery.of(context).size.height * 0.35;
    final downThreshhold = MediaQuery.of(context).size.height * 0.75;

    var newHeight = _infoHeight - delta;

    //don't go over or under
    if (newHeight < minHeight || newHeight > maxHeight) {
      return;
    }

    //speed is most important first

    //is it moving up or down.
    bool up = newHeight > _infoHeight;
    if (up) {
      if (newHeight > upThreshhold) {
        _heightOnTouchUp = maxHeight;
      } else {
        _heightOnTouchUp = minHeight;
      }
    } else {
      if (newHeight < downThreshhold) {
        _heightOnTouchUp = minHeight;
      } else {
        _heightOnTouchUp = maxHeight;
      }
    }

    setState(() {
      _infoHeight = newHeight;
    });
  }
}

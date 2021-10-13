import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gospel_track/gospel_track/page_number.dart';
import 'package:provider/src/provider.dart';

class PulsingElement extends StatefulWidget {
  IconData iconData;

  PulsingElement(this.iconData, {Key? key}) : super(key: key);

  @override
  _PulsingElementState createState() => _PulsingElementState();
}

class _PulsingElementState extends State<PulsingElement>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> animation;
  final _max = 2;

  @override
  void initState() {
    super.initState();

    context.read<PageNumber>().pulseCounter[widget.iconData] = 0;

    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.transparent, end: Colors.black54)
        .animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
          var pulseCounter =
              context.read<PageNumber>().pulseCounter[widget.iconData]!;
          context.read<PageNumber>().pulseCounter[widget.iconData] =
              pulseCounter + 1;
        }
      })
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible:
            context.read<PageNumber>().pulseCounter[widget.iconData]! <= _max,
        child: Icon(widget.iconData, color: animation.value));
  }
}

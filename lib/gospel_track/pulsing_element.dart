import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.transparent, end: Colors.black54)
        .animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
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
    return Icon(widget.iconData, color: animation.value);
  }
}

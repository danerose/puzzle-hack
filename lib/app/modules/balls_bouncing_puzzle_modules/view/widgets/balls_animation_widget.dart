//Dart
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:math';

//Flutter
import 'package:flutter/material.dart';

class BallsAnimationWidget extends StatefulWidget {
  const BallsAnimationWidget({
    Key? key,
    this.size = 20,
    required this.globalKey,
    required this.colors,
    required this.color,
    required this.x,
    required this.y,
    required this.changeOnLimit,
  }) : super(key: key);

  final GlobalKey globalKey;
  final double size;
  final double x;
  final double y;
  final List<Color> colors;
  final int color;
  final bool changeOnLimit;
  @override
  BouncingFlutterLogoState createState() => BouncingFlutterLogoState();
}

class BouncingFlutterLogoState extends State<BallsAnimationWidget> {
  final  GlobalKey _globalKey = GlobalKey();
  late Timer _updateTimer;

  @override
  void initState() {
    super.initState();
    _x = widget.x;
    _y = widget.y;
    _color = widget.color;
    _scheduleUpdate();
  }

  @override
  void dispose() {
    _updateTimer.cancel();
    super.dispose();
  }

  late double _x = 0; 
  late double _y = 0;
  late int _dx = 1;
  late int _dy = 1;
  late int _color = 0;


  void _update() {
    final availableSize = (context.findRenderObject() as RenderBox?)?.constraints ?? const BoxConstraints();
    final size = (_globalKey.currentContext?.findRenderObject() as RenderBox?)?.size ?? Size.zero;

    final previousDx = _dx, previousDy = _dy;

    if (availableSize.maxWidth < _x + size.width) {
      _dx = -1;
    } else if (_x < 0) {
      _dx = 1;
    }
    if (availableSize.maxHeight < _y + size.height) {
      _dy = -1;
    } else if (_y < 0) {
      _dy = 1;
    }
    if (previousDx != _dx || previousDy != _dy) {
      _color = widget.changeOnLimit ? Random().nextInt(4) : widget.color;
    }
    setState(() {
      _x += _dx * 2;
      _y += _dy * 2;
    });
    _scheduleUpdate();
  }

  void _scheduleUpdate() {
    _updateTimer = Timer(
      // Lock the update rate, no matter the frame rate.
      const Duration(microseconds: 1e6 ~/ 60),
      _update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          top: _y,
          left:  _x ,
          duration: const Duration(microseconds: 1e6 ~/ 60),
          child: Container(
            key: _globalKey,
            width:  widget.size ,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.colors[_color],
              borderRadius: BorderRadius.circular(1000),
            ),
          ),
        ),
      ],
    );
  }
}

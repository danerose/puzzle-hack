import 'package:flutter/widgets.dart';

class BallsPainter extends CustomPainter {

  BallsPainter({
    required this.x,
    required this.y,
    required this.s,
    required this.c,
  }) : super();

  final double x;
  final double y;
  final double s;
  final Color c;

  @override
  void paint(Canvas canvas, Size size) {
     canvas.drawCircle(Offset(x, y),s,Paint()..color = c);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

//Dart
import 'dart:ui';

//Flutter
import 'package:flutter/material.dart';

class GlassMorphismWidget extends StatelessWidget {
  const GlassMorphismWidget({
    Key? key,
    required this.child,
    required this.start,
    required this.end,
    this.colorStart = Colors.white,
    this.colorEnd = Colors.white,
  }) : super(key: key);

  final Widget child;
  final double start;
  final double end;
  final Color colorEnd;
  final Color colorStart;
 
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorStart.withOpacity(start),
                colorEnd.withOpacity(end),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';
import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';



class PuzzleTitle extends StatelessWidget {
  const PuzzleTitle({
    Key? key,
    required this.title,
    this.color,
  }) : super(key: key);

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (context, child) => Center(
        child: SizedBox(
          width: 300,
          child: Center(
            child: child,
          ),
        ),
      ),
      medium: (context, child) => Center(
        child: child,
      ),
      large: (context, child) => SizedBox(
        width: 300,
        child: child,
      ),
      child: (currentSize) {
        return AnimatedDefaultTextStyle(
          style: const TextStyle(),
          duration: PuzzleThemeAnimationDuration.textStyle,
          child: Text(
            title,
            textAlign: currentSize == ResponsiveLayoutSize.small
            ? TextAlign.center
            : TextAlign.left,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';

import 'package:puzzle_hack/core/widget/button/animated_text_button.dart';


class PuzzleButton extends StatelessWidget {
  const PuzzleButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145,
      height: 44,
      child: AnimatedTextButton(
        duration: PuzzleThemeAnimationDuration.textStyle,
        onPressed: onPressed,
        style: const ButtonStyle(),
        child: child,
      ),
    );
  }
}

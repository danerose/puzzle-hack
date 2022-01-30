//Flutter
import 'package:flutter/material.dart';

import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';

import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

class FlutterLogoComponent extends StatelessWidget {
  const FlutterLogoComponent({
    Key? key,
    this.isColored = true,
    this.height,
  }) : super(key: key);

  /// Whether this logo is colored.
  final bool isColored;

  /// The optional height of this logo.
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: PuzzleThemeAnimationDuration.logoChange,
      child: height != null
    ? Image.asset(
         isColored
        ? 'assets/logo/logo_flutter_color.png'
        : 'assets/logo/logo_flutter_white.png',
        height: height,
      )
    : ResponsiveLayoutBuilder(
        key: Key( isColored
          ? 'assets/logo/logo_flutter_color.png'
          : 'assets/logo/logo_flutter_white.png',
        ),
        small: (_, __) => Image.asset(
           isColored
          ? 'assets/logo/logo_flutter_color.png'
          : 'assets/logo/logo_flutter_white.png',
          height: 24,
        ),
        medium: (_, __) => Image.asset(
           isColored
          ? 'assets/logo/logo_flutter_color.png'
          : 'assets/logo/logo_flutter_white.png',
          height: 29,
        ),
        large: (_, __) => Image.asset(
           isColored
          ? 'assets/logo/logo_flutter_color.png'
          : 'assets/logo/logo_flutter_white.png',
          height: 32,
        ),
      ),
    );
  }
}

//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/timer/timer_bloc.dart';
import 'package:puzzle_hack/core/bloc/timer/timer_state.dart';

import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';

import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';
import 'package:puzzle_hack/core/utils/helpers/duration_helpers.dart';


class SakuraTimerWidget extends StatelessWidget {
  const SakuraTimerWidget({
    Key? key,
    this.textStyle,
    this.iconSize,
    this.iconPadding,
    this.mainAxisAlignment,
  }) : super(key: key);

  /// The optional [TextStyle] of this timer.
  final TextStyle? textStyle;
  /// The optional icon [Size] of this timer.
  final Size? iconSize;
  /// The optional icon padding of this timer.
  final double? iconPadding;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, child) => child!,
      medium: (_, child) => child!,
      large: (_, child) => child!,
      child: (currentSize) {
        return BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            return Row(
              key: const Key('sakura_timer'),
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  style: const TextStyle(),
                  duration: PuzzleThemeAnimationDuration.textStyle,
                  child: Text(
                    DurationHelper.formatDuration(
                      Duration(seconds: state.secondsElapsed),
                    ),
                    key: ValueKey(state.secondsElapsed),
                    semanticsLabel: DurationHelper.getDurationLabel(
                      Duration(seconds: state.secondsElapsed),
                    ),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: currentSize == ResponsiveLayoutSize.large ?
                      30 : 24,
                    ),
                  ),
                ),
                Gap(iconPadding ?? 8),
                Icon(
                  Icons.timer,
                  key: const Key('sakura_timer_icon'),
                  color: Theme.of(context).colorScheme.onPrimary,
                  size:  iconSize?.width  ??
                    (currentSize == ResponsiveLayoutSize.large
                    ? const Size(28, 28).width
                    : const Size(32, 32).width
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

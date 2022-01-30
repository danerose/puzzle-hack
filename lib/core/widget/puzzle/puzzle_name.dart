import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:puzzle_hack/core/bloc/theme/theme_bloc.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_state.dart';

import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';

import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';


class PuzzleName extends StatelessWidget {
  const PuzzleName({
    Key? key,
    this.color,
  }) : super(key: key);


  final Color? color;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context,ThemeState state) {
        return ResponsiveLayoutBuilder(
          small: (context, child) => const SizedBox(),
          medium: (context, child) => const SizedBox(),
          large: (context, child) => AnimatedDefaultTextStyle(
            style: const TextStyle(),
            duration: PuzzleThemeAnimationDuration.textStyle,
            child: Text(
              state.theme.name,
              key: const Key('puzzle_name_theme'),
            ),
          ),
        );
      },
    );
  }
}

//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/theme/theme_bloc.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_state.dart';

//Theme
import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';

//Layout
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
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              key: const Key('puzzle_name_theme'),
            ),
          ),
        );
      },
    );
  }
}

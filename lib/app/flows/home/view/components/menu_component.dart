//Flutter
// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_hack/core/bloc/particles/particles_bloc.dart';
import 'package:puzzle_hack/core/bloc/particles/particles_event.dart';


import 'package:puzzle_hack/core/theme/puzzle_theme.dart';

//Bloc

import 'package:puzzle_hack/core/bloc/timer/timer_bloc.dart'; 
import 'package:puzzle_hack/core/bloc/timer/timer_event.dart'; 


import 'package:puzzle_hack/core/bloc/theme/theme_bloc.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_state.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_event.dart';

import 'package:puzzle_hack/core/bloc/puzzle/puzzle_bloc.dart';
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_event.dart';


import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_bloc.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_event.dart';

import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';

import 'package:puzzle_hack/core/widget/audio/audio_control.dart';

import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';


class MenuComponent extends StatelessWidget {
  const MenuComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final themes = context.select((ThemeBloc bloc) => bloc.state.themes);

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              state.themes.length, (index) => MenuComponentItem(
                theme: state.themes[index],
                themeIndex: index,
              ),
            ),
            ResponsiveLayoutBuilder(
              small: (_, child) => const SizedBox(),
              medium: (_, child) => child!,
              large: (_, child) => child!,
              child: (currentSize) {
                return Row(
                  children: [
                    const Gap(44),
                    AudioControl(
                      key: GlobalKey(debugLabel: 'audio_control'),
                    )
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}




class MenuComponentItem extends StatelessWidget {
  const MenuComponentItem({
    Key? key,
    required this.theme,
    required this.themeIndex,
  }) : super(key: key);

  final PuzzleTheme theme;
  final int themeIndex;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return ResponsiveLayoutBuilder(
          small: (_, child) => Column(
            children: [
              Container(
                width: 100,
                height: 40,
                decoration: theme == state.theme
                  ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    )
                  : null,
                child: child,
              ),
            ],
          ),
          medium: (_, child) => child!,
          large: (_, child) => child!,
          child: (currentSize) {
            final leftPadding = themeIndex > 0 && currentSize 
              != ResponsiveLayoutSize.small ? 40.0 : 0.0;
            return Padding(
              padding: EdgeInsets.only(left: leftPadding),
              child: Tooltip(
                message:
                  theme != state.theme 
                  ? 'Changing the theme will reset your score' : '',
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ).copyWith(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    if (theme == state.theme) {return;}
                    // Update the currently selected theme.
                    context.read<ThemeBloc>().add(
                      ThemeChanged(themeIndex: themeIndex),
                    );
                    // Reset the timer of the currently running puzzle.
                    context.read<TimerBloc>().add(const TimerReset());
    
                    // Stop the Dashatar countdown if it has been started.
                    context.read<SakuraPuzzleBloc>().add(
                      const SakuraCountdownStopped(),
                    );

                    context.read<ParticlesBloc>().add(
                      ParticlesInitialized(),
                    );
                    // Initialize the puzzle board for the newly selected theme.
                    context.read<PuzzleBloc>().add(const PuzzleInitialized(
                      shufflePuzzle: false,
                      ),
                    );
                  },
                  child: AnimatedDefaultTextStyle(
                    duration: PuzzleThemeAnimationDuration.textStyle,
                    style: TextStyle(
                      color: theme == state.theme 
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onPrimary,
                      fontSize: currentSize == ResponsiveLayoutSize.small ? 14: 16,
                      letterSpacing: currentSize == ResponsiveLayoutSize.small ? 0 : 2,
                      fontWeight: FontWeight.w700,
                    ),
                    child: Text(theme.name),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

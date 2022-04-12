//Dart
import 'dart:async';

//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_bloc.dart';
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_state.dart';

import 'package:puzzle_hack/core/bloc/timer/timer_bloc.dart';

import 'package:puzzle_hack/core/bloc/audio/audio_control_bloc.dart';

import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/theme/sakura_theme_bloc.dart';

//Builders
import 'package:puzzle_hack/core/utils/builder/modal_builder.dart';

//Components
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/components/sakura_share_dialog_component.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

abstract class _BoardSize {
  static double small = 312;
  static double medium = 424;
  static double large = 472;
}

class SakuraPuzzleBoardComponent extends StatefulWidget {
  const SakuraPuzzleBoardComponent({
    Key? key,
    required this.tiles,
  }) : super(key: key);

  final List<Widget> tiles;
  @override
  State<SakuraPuzzleBoardComponent> createState() => 
  _SakuraPuzzleBoardComponentState();
}

class _SakuraPuzzleBoardComponentState 
  extends State<SakuraPuzzleBoardComponent> {
  Timer? _completePuzzleTimer;

  @override
  void dispose() {
    _completePuzzleTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PuzzleBloc, PuzzleState>(
      listener: (BuildContext _,PuzzleState state) async {
        if (state.puzzleStatus == PuzzleStatus.complete) {
          _completePuzzleTimer =
              Timer(const Duration(milliseconds: 370), () async {
            await showAppDialog<void>(
              context: context,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: context.read<SakuraThemeBloc>(),
                  ),
                  BlocProvider.value(
                    value: context.read<PuzzleBloc>(),
                  ),
                  BlocProvider.value(
                    value: context.read<TimerBloc>(),
                  ),
                  BlocProvider.value(
                    value: context.read<AudioControlBloc>(),
                  ),
                ],
                child: const SakuraShareDialogComponent(),
              ),
            );
          });
        }
      },
      child: ResponsiveLayoutBuilder(
        small: (_, child) => SizedBox.square(
          key: const Key('sakura_puzzle_board_small'),
          dimension: _BoardSize.small,
          child: child,
        ),
        medium: (_, child) => SizedBox.square(
          key: const Key('sakura_puzzle_board_medium'),
          dimension: _BoardSize.medium,
          child: child,
        ),
        large: (_, child) => SizedBox.square(
          key: const Key('sakura_puzzle_board_large'),
          dimension: _BoardSize.large,
          child: child,
        ),
        child: (_) => Stack(children: widget.tiles),
      ),
    );
  }
}

//Dart
import 'dart:async';

//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:just_audio/just_audio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_bloc.dart';
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_event.dart';

import 'package:puzzle_hack/core/bloc/timer/timer_bloc.dart';
import 'package:puzzle_hack/core/bloc/timer/timer_event.dart';

import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_bloc.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_state.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';


//Extensions
import 'package:puzzle_hack/core/utils/extensions/audio_player_extension.dart';

//Widgets
import 'package:puzzle_hack/core/widget/audio/audio_control_listener.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/widgets/sakura_countdown_go_widget.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/widgets/sakura_countdown_seconds_begin_widget.dart';


class SakuraCountdownComponent extends StatefulWidget {
  const SakuraCountdownComponent({
    Key? key,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<SakuraCountdownComponent> createState() => 
  _SakuraCountdownComponentState();
}

class _SakuraCountdownComponentState extends State<SakuraCountdownComponent> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = widget._audioPlayerFactory()
      ..setAsset('assets/audio/sakura_counter.mp3');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AudioControlListener(
      audioPlayer: _audioPlayer,
      child: BlocListener<SakuraPuzzleBloc, SakuraPuzzleState>(
        listener: (context, state) {
          if (!state.isCountdownRunning) {
            return;
          }
          // Play the shuffle sound when the countdown from 3 to 1 begins.
          if (state.secondsToBegin == 3) {
            unawaited(_audioPlayer.replay());
          }
          // Start the puzzle timer when the countdown finishes.
          if (state.status == SakuraPuzzleStatus.started) {
            context.read<TimerBloc>().add(const TimerStarted());
          }
          // Shuffle the puzzle on every countdown tick.
          if (state.secondsToBegin >= 1 && state.secondsToBegin <= 3) {
            context.read<PuzzleBloc>().add(const PuzzleReset());
          }
        },
        child: ResponsiveLayoutBuilder(
          small: (_, __) => const SizedBox(),
          medium: (_, __) => const SizedBox(),
          large: (_, __) =>
              BlocBuilder<SakuraPuzzleBloc, SakuraPuzzleState>(
            builder: (context, state) {
              if (!state.isCountdownRunning || state.secondsToBegin > 3) {
                return const SizedBox();
              }
              if (state.secondsToBegin > 0) {
                return SakuraCountdownSecondsToBeginWidget(
                  key: ValueKey(state.secondsToBegin),
                  secondsToBegin: state.secondsToBegin,
                );
              } else {
                return const SakuraCountdownGoWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}

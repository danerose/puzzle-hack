//Dart
import 'dart:async';

//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:just_audio/just_audio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/timer/timer_bloc.dart';
import 'package:puzzle_hack/core/bloc/timer/timer_event.dart';

import 'package:puzzle_hack/core/bloc/puzzle/puzzle_bloc.dart';
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_event.dart';

import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_bloc.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_state.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_event.dart';

//Extensions
import 'package:puzzle_hack/core/utils/extensions/audio_player_extension.dart';

//Widget
import 'package:puzzle_hack/core/widget/audio/audio_control_listener.dart';
import 'package:puzzle_hack/core/widget/puzzle/puzzle_button.dart';

class SakuraPuzzleActionButtonComponent extends StatefulWidget {
  const SakuraPuzzleActionButtonComponent({
    Key? key, AudioPlayerFactory? audioPlayer,
  }) : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
    super(key: key);

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<SakuraPuzzleActionButtonComponent> createState() =>
      _SakuraPuzzleActionButtonComponentState();
}

class _SakuraPuzzleActionButtonComponentState
    extends State<SakuraPuzzleActionButtonComponent> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = widget._audioPlayerFactory()
      ..setAsset('assets/audio/click.mp3');
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
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: BlocBuilder<SakuraPuzzleBloc, SakuraPuzzleState>(
          builder: (BuildContext context,SakuraPuzzleState state) {
            return Tooltip(
              key: ValueKey(state.status),
              message: state.status == SakuraPuzzleStatus.started ? 
              'Restarting the puzzle will reset your score':'',
              verticalOffset: 40,
              child: PuzzleButton(
                onPressed:  state.status == SakuraPuzzleStatus.loading
                ? null
                : () async {
                    // Reset the timer and the countdown.
                    context.read<TimerBloc>().add(const TimerReset());
                    context.read<SakuraPuzzleBloc>().add(
                      SakuraCountdownReset(
                        secondsToBegin:state.status==SakuraPuzzleStatus.started
                        ? 5 : 3,
                      ),
                    );
                    // Initialize the puzzle board to show the initial puzzle
                    // (unshuffled) before the countdown completes.
                    if (state.status==SakuraPuzzleStatus.started) {
                      context.read<PuzzleBloc>().add(
                        const PuzzleInitialized(shufflePuzzle: false),
                      );
                    }
                    unawaited(_audioPlayer.replay());
                  },
                textColor: state.status == SakuraPuzzleStatus.loading
                ? Theme.of(context).colorScheme.onPrimary 
                : Theme.of(context).colorScheme.primary,
                child: state.status == SakuraPuzzleStatus.started 
                ? Text('Restart',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onError,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                )
                : Text(state.status == SakuraPuzzleStatus.loading
                  ? 'Get ready...' : 'Start Game',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

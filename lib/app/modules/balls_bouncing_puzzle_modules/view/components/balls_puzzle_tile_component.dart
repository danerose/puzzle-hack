//Dart
// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:math';

//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:just_audio/just_audio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_bloc.dart';
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_event.dart';
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_state.dart';


import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/puzzle/balls_puzzle_bloc.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/puzzle/balls_puzzle_state.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

//Theme

import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';

//Models
import 'package:puzzle_hack/core/data/models/tile/tile.dart';

import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/widgets/balls_animation_widget.dart';
//Extensions
import 'package:puzzle_hack/core/utils/extensions/audio_player_extension.dart';
import 'package:puzzle_hack/core/widget/audio/audio_control_listener.dart';
import 'package:puzzle_hack/core/widget/common/glassmorphism_widget.dart';


abstract class _TileSize {
  static double small = 75;
  static double medium = 100;
  static double large = 112;
}


class BallsPuzzleTileComponent extends StatefulWidget {
  const BallsPuzzleTileComponent({
    Key? key,
    required this.tile,
    required this.state,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  final Tile tile;
  final PuzzleState state;
  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<BallsPuzzleTileComponent> createState() => 
  BallsPuzzleTileComponentState();
}

@visibleForTesting
class BallsPuzzleTileComponentState extends State<BallsPuzzleTileComponent>
    with SingleTickerProviderStateMixin {
  AudioPlayer? _audioPlayer;
  late final Timer _timer;

  /// The controller that drives [_scale] animation.
  late AnimationController _controller;
  late Animation<double> _scale;
  final GlobalKey _key = GlobalKey();



  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: PuzzleThemeAnimationDuration.puzzleTileScale,
    );

    _scale = Tween<double>(begin: 1, end: 0.94).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1, curve: Curves.easeInOut),
      ),
    );

    // Delay the initialization of the audio player for performance reasons,
    // to avoid dropping frames when the theme is changed.
    _timer = Timer(const Duration(seconds: 1), () {
      _audioPlayer = widget._audioPlayerFactory()
        ..setAsset('assets/audio/tile_move.mp3');
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final puzzleIncomplete = context.select((PuzzleBloc bloc) => bloc.state.puzzleStatus) == PuzzleStatus.incomplete;  
    final size = widget.state.puzzle.getDimension();
    final balls =  widget.tile.value <= 5 ? 1 : widget.tile.value <= 10  ? 2 : 3;
    return AudioControlListener(
      audioPlayer: _audioPlayer,
      child: BlocBuilder<BallsPuzzleBloc, BallsPuzzleState>(
        builder: (BuildContext _,BallsPuzzleState pState) {
          return AnimatedAlign(
            alignment: FractionalOffset(
              (widget.tile.currentPosition.x - 1) / (size - 1),
              (widget.tile.currentPosition.y - 1) / (size - 1),
            ),
            duration: pState.status == BallsPuzzleStatus.loading
              ? const Duration(milliseconds: 800)
              : const Duration(milliseconds: 370),
            curve: Curves.easeInOut,
            child: ResponsiveLayoutBuilder(
              small: (_, child) => SizedBox.square(
                key: Key('balls_puzzle_tile_small_${widget.tile.value}'),
                dimension: _TileSize.small,
                child: child,
              ),
              medium: (_, child) => SizedBox.square(
                key: Key('balls_puzzle_tile_medium_${widget.tile.value}'),
                dimension: _TileSize.medium,
                child: child,
              ),
              large: (_, child) => SizedBox.square(
                key: Key('balls_puzzle_tile_large_${widget.tile.value}'),
                dimension: _TileSize.large,
                child: child,
              ),
              child: (_) => MouseRegion(
                onEnter: (_) {
                  if (pState.status == BallsPuzzleStatus.started
                      && puzzleIncomplete) 
                  {
                    _controller.forward();
                  }
                },
                onExit: (_) {
                  if (pState.status == BallsPuzzleStatus.started 
                    && puzzleIncomplete) 
                  {
                    _controller.reverse();
                  }
                },
                child: ScaleTransition(
                  key: Key('balls_puzzle_tile_scale_${widget.tile.value}'),
                  scale: _scale,
                  child: SizedBox.square(
                    dimension: _TileSize.large,
                    child: InkWell(
                      onTap: pState.status == BallsPuzzleStatus.started 
                        && puzzleIncomplete
                        ? () {
                            context.read<PuzzleBloc>().add(
                              TileTapped(widget.tile),
                            );
                            unawaited(_audioPlayer?.replay());
                          }
                        : null,
                        child: GlassMorphismWidget(
                        start: 1,
                        end: 0.1,
                        child: Stack(
                          children: [
                            for (var i = 0; i < balls; i++)
                            BallsAnimationWidget(
                              changeOnLimit: false,
                              globalKey: _key, 
                              x: Random().nextInt(99).toDouble() * 2, 
                              y: Random().nextInt(99).toDouble() * 2,
                              color: Random().nextInt(4),
                              size: _ == ResponsiveLayoutSize.small ? 10 : 20,
                              colors: [
                                Theme.of(context).colorScheme.primary,
                                Theme.of(context).colorScheme.primaryVariant,
                                Theme.of(context).colorScheme.secondary,
                                Theme.of(context).colorScheme.secondaryVariant,
                              ],
                            ),
                            Center(
                              child: Text(
                                widget.tile.value.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

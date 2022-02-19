//Dart
import 'dart:async';

//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:just_audio/just_audio.dart';
import 'package:puzzle_hack/core/layout/responsive_gap.dart';

//Builder
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/builder/balls_share_dialog_animated_builder.dart';


//Extensions
import 'package:puzzle_hack/core/widget/audio/audio_control_listener.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

//Extensions
import 'package:puzzle_hack/core/utils/extensions/audio_player_extension.dart';

//Components
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/components/balls_score_component.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/components/balls_share_your_score_component.dart';

class BallsShareDialogComponent extends StatefulWidget {
  const BallsShareDialogComponent({
    Key? key,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<BallsShareDialogComponent> createState() => 
  _BallsShareDialogComponentState();
}

class _BallsShareDialogComponentState extends State<BallsShareDialogComponent>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AudioPlayer _successAudioPlayer;
  late final AudioPlayer _clickAudioPlayer;

  @override
  void initState() {
    super.initState();

    _successAudioPlayer = widget._audioPlayerFactory()
      ..setAsset('assets/audio/success.mp3');
    unawaited(_successAudioPlayer.play());

    _clickAudioPlayer = widget._audioPlayerFactory()
      ..setAsset('assets/audio/click.mp3');

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    Future.delayed(
      const Duration(milliseconds: 140),
      _controller.forward,
    );
  }

  @override
  void dispose() {
    _successAudioPlayer.dispose();
    _clickAudioPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AudioControlListener(
      key: const Key('balls_share_dialog_success_audio_player'),
      audioPlayer: _successAudioPlayer,
      child: AudioControlListener(
        key: const Key('balls_share_dialog_click_audio_player'),
        audioPlayer: _clickAudioPlayer,
        child: ResponsiveLayoutBuilder(
          small: (_, child) => child!,
          medium: (_, child) => child!,
          large: (_, child) => child!,
          child: (currentSize) {
            final padding = currentSize == ResponsiveLayoutSize.large
                ? const EdgeInsets.fromLTRB(68, 82, 68, 73)
                : (currentSize == ResponsiveLayoutSize.medium
                    ? const EdgeInsets.fromLTRB(48, 54, 48, 53)
                    : const EdgeInsets.fromLTRB(20, 99, 20, 76));

            final closeIconOffset = currentSize == ResponsiveLayoutSize.large
                ? const Offset(44, 37)
                : (currentSize == ResponsiveLayoutSize.medium
                    ? const Offset(25, 28)
                    : const Offset(17, 63));

            final crossAxisAlignment = currentSize == ResponsiveLayoutSize.large
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center;

            return Stack(
              key: const Key('balls_share_dialog'),
              children: [
                SingleChildScrollView(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxWidth,
                        child: Padding(
                          padding: padding,
                          child: BallsShareDialogAnimatedBuilder(
                            animation: _controller,
                            builder: (context, child, animation) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: crossAxisAlignment,
                                children: [
                                  SlideTransition(
                                    position: animation.scoreOffset,
                                    child: Opacity(
                                      opacity: animation.scoreOpacity.value,
                                      child: const BallsScoreComponent(),
                                    ),
                                  ),
                                  const ResponsiveGap(
                                    small: 40,
                                    medium: 40,
                                    large: 80,
                                  ),
                                  BallsShareYourScoreComponent(
                                    animation: animation,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  right: closeIconOffset.dx,
                  top: closeIconOffset.dy,
                  child: IconButton(
                    key: const Key('sakura_share_dialog_close_button'),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    iconSize: 18,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      unawaited(_clickAudioPlayer.play());
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:just_audio/just_audio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_hack/core/bloc/particles/particles_bloc.dart';
import 'package:puzzle_hack/core/bloc/particles/particles_event.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/theme/theme_bloc.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_event.dart';

import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/theme/balls_theme_bloc.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/theme/balls_theme_event.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/theme/balls_theme_state.dart';

//Extensions
import 'package:puzzle_hack/core/utils/extensions/audio_player_extension.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

//Widget
import 'package:puzzle_hack/core/widget/audio/audio_control_listener.dart';
import 'package:puzzle_hack/core/widget/common/glassmorphism_widget.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/widgets/balls_animation_widget.dart';

class BallsThemePickerComponent extends StatefulWidget {
  const BallsThemePickerComponent({
    Key? key,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  static const _activeThemeNormalSize = 90.0;
  static const _inactiveThemeNormalSize = 66.0;
  static const _activeThemeSmallSize = 45.0;
  static const _inactiveThemeSmallSize = 35.0;

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<BallsThemePickerComponent> createState() =>
  _BallsThemePickerComponentState();
}

class _BallsThemePickerComponentState extends
State<BallsThemePickerComponent> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = widget._audioPlayerFactory();
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
      child: ResponsiveLayoutBuilder(
        small: (_, child) => child!,
        medium: (_, child) => child!,
        large: (_, child) => child!,
        child: (currentSize) {
          final isSmallSize = currentSize == ResponsiveLayoutSize.small;
          final activeSize = isSmallSize
              ? BallsThemePickerComponent._activeThemeSmallSize
              : BallsThemePickerComponent._activeThemeNormalSize;
          final inactiveSize = isSmallSize
              ? BallsThemePickerComponent._inactiveThemeSmallSize
              : BallsThemePickerComponent._inactiveThemeNormalSize;
          return BlocBuilder<BallsThemeBloc,BallsThemeState>(
            builder: (BuildContext _,BallsThemeState state) {
              return SizedBox(
                key: const Key('balls_theme_picker'),
                height: activeSize,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(state.themes.length, (index) {
                    final theme = state.themes[index];
                    final isActiveTheme = theme == state.theme;
                    final padding = index >0? (isSmallSize ? 4.0 : 8.0) : 0.0;
                    final size = isActiveTheme ? activeSize : inactiveSize;
                    return Padding(
                      padding: EdgeInsets.only(left: padding),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          key: Key('balls_theme_picker_$index'),
                          onTap: () async {
                            if (isActiveTheme) {
                              return;
                            }
                            // Update the current Balls theme.
                            context.read<ParticlesBloc>().add(
                              const ParticlesActiveDisabled(
                                activeOrDisabled: false,
                              ),
                            );
                            context.read<BallsThemeBloc>().add(
                              BallsThemeChanged(themeIndex: index),
                            );
                            context.read<ThemeBloc>().add(
                              ThemeUpdated(theme: theme),
                            );
                            // Play the audio of the current Balls theme.
                            await _audioPlayer.setAsset(theme.audioAsset);
                            unawaited(_audioPlayer.play());
                          },
                          child: AnimatedContainer(
                            width: size,
                            height: size,
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 350),
                            child: GlassMorphismWidget(
                              start: 1,
                              end: 0.1,
                              colorStart: theme.themeData.colorScheme.secondaryContainer,
                              child: BallsAnimationWidget(
                                changeOnLimit: false,
                                color: 0,
                                size: isSmallSize ?  10 : 20,
                                colors: [theme.themeData.colorScheme.primary],
                                x: size / 2,
                                y: 0,
                                globalKey: GlobalKey(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );},
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

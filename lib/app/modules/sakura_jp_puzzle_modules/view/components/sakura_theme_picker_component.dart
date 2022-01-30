import 'dart:async';

//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:just_audio/just_audio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/theme/theme_bloc.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_event.dart';

import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/theme/sakura_theme_bloc.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/theme/sakura_theme_state.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/theme/sakura_theme_event.dart';

//Extensions
import 'package:puzzle_hack/core/utils/extensions/audio_player_extension.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

//Widget
import 'package:puzzle_hack/core/widget/audio/audio_control_listener.dart';

class SakuraThemePickerComponent extends StatefulWidget {
  const SakuraThemePickerComponent({
    Key? key,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  static const _activeThemeNormalSize = 120.0;
  static const _activeThemeSmallSize = 65.0;
  static const _inactiveThemeNormalSize = 96.0;
  static const _inactiveThemeSmallSize = 50.0;

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<SakuraThemePickerComponent> createState() =>
  _SakuraThemePickerComponentState();
}

class _SakuraThemePickerComponentState extends
State<SakuraThemePickerComponent> {
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
              ? SakuraThemePickerComponent._activeThemeSmallSize
              : SakuraThemePickerComponent._activeThemeNormalSize;
          final inactiveSize = isSmallSize
              ? SakuraThemePickerComponent._inactiveThemeSmallSize
              : SakuraThemePickerComponent._inactiveThemeNormalSize;
          return BlocBuilder<SakuraThemeBloc,SakuraThemeState>(
            builder: (BuildContext _,SakuraThemeState state) {
              return SizedBox(
                key: const Key('sakura_theme_picker'),
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
                          key: Key('sakura_theme_picker_$index'),
                          onTap: () async {
                            if (isActiveTheme) {
                              return;
                            }
                            // Update the current Sakura theme.
                            context.read<SakuraThemeBloc>().add(
                              SakuraThemeChanged(themeIndex: index),
                            );
                            context.read<ThemeBloc>().add(
                              ThemeUpdated(theme: theme),
                            );
                            // Play the audio of the current Sakura theme.
                            await _audioPlayer.setAsset(theme.audioAsset);
                            unawaited(_audioPlayer.play());
                          },
                          child: AnimatedContainer(
                            width: size,
                            height: size,
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 350),
                            child: Icon(
                              Icons.ac_unit_outlined,
                              color: theme.themeData.colorScheme.primary,
                              semanticLabel: theme.semanticsLabel(context),
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

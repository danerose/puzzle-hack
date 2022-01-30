//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/audio/audio_control_bloc.dart';
import 'package:puzzle_hack/core/bloc/audio/audio_control_state.dart';
import 'package:puzzle_hack/core/bloc/audio/audio_control_event.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

//Theme
import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';

class AudioControl extends StatelessWidget {
  const AudioControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioControlBloc, AudioControlState>(
      builder: (context, state) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => context.read<AudioControlBloc>().add(AudioToggled()),
            child: AnimatedSwitcher(
              duration: PuzzleThemeAnimationDuration.backgroundColorChange,
              child: ResponsiveLayoutBuilder(
                key: Key( state.muted ? 'audio_control_off':'audio_control_on'),
                small: (_, __) => Icon(
                  state.muted ? Icons.music_off : Icons.music_note,
                  key: const Key('audio_control_small'),
                  size: 24,
                ),
                medium: (_, __) => Icon(
                  state.muted ? Icons.music_off : Icons.music_note,
                  key: const Key('audio_control_medium'),
                  size: 33,
                ),
                large: (_, __) => Icon(
                  state.muted ? Icons.music_off : Icons.music_note,
                  key: const Key('audio_control_large'),
                  size: 33,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

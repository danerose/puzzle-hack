//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:just_audio/just_audio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/audio/audio_control_bloc.dart';
import 'package:puzzle_hack/core/bloc/audio/audio_control_state.dart';

class AudioControlListener extends StatefulWidget {
  const AudioControlListener({
    Key? key,
    this.audioPlayer,
    required this.child,
  }) : super(key: key);

  /// The audio player to be muted/unmuted when the audio status changes.
  final AudioPlayer? audioPlayer;
  final Widget child;

  @override
  State<AudioControlListener> createState() => _AudioControlListenerState();
}

class _AudioControlListenerState extends State<AudioControlListener> {
  @override
  void didChangeDependencies() {
    updateAudioPlayer(muted: context.read<AudioControlBloc>().state.muted);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant AudioControlListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateAudioPlayer(muted: context.read<AudioControlBloc>().state.muted);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AudioControlBloc, AudioControlState>(
      listener: (context, state) => updateAudioPlayer(muted: state.muted),
      child: widget.child,
    );
  }

  void updateAudioPlayer({required bool muted}) {
    widget.audioPlayer?.setVolume(muted ? 0.0 : 1.0);
  }
}

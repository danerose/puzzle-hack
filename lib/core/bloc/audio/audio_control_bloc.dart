//Dependencies
import 'package:bloc/bloc.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/audio/audio_control_state.dart';
import 'package:puzzle_hack/core/bloc/audio/audio_control_event.dart';

class AudioControlBloc extends Bloc<AudioControlEvent, AudioControlState> {
  AudioControlBloc() : super(const AudioControlState()) {
    on<AudioToggled>(_onAudioToggled);
  }

  void _onAudioToggled(AudioToggled event, Emitter<AudioControlState> emit) {
    emit(AudioControlState(muted: !state.muted));
  }
}

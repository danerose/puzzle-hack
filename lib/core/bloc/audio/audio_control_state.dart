import 'package:equatable/equatable.dart';

class AudioControlState extends Equatable {
  const AudioControlState({
    this.muted = false,
  });

  /// Whether the audio is muted.
  final bool muted;

  @override
  List<Object> get props => [muted];
}

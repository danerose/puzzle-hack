import 'package:equatable/equatable.dart';

abstract class AudioControlEvent extends Equatable {
  const AudioControlEvent();

  @override
  List<Object> get props => [];
}

class AudioToggled extends AudioControlEvent {}

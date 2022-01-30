import 'package:equatable/equatable.dart';

abstract class SakuraPuzzleEvent extends Equatable {
  const SakuraPuzzleEvent();

  @override
  List<Object?> get props => [];
}

class SakuraCountdownStarted extends SakuraPuzzleEvent {
  const SakuraCountdownStarted();
}

class SakuraCountdownTicked extends SakuraPuzzleEvent {
  const SakuraCountdownTicked();
}

class SakuraCountdownStopped extends SakuraPuzzleEvent {
  const SakuraCountdownStopped();
}

class SakuraCountdownReset extends SakuraPuzzleEvent {
  const SakuraCountdownReset({this.secondsToBegin});

  final int? secondsToBegin;

  @override
  List<Object?> get props => [secondsToBegin];
}

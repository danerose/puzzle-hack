import 'package:equatable/equatable.dart';

abstract class BallsPuzzleEvent extends Equatable {
  const BallsPuzzleEvent();

  @override
  List<Object?> get props => [];
}

class BallsCountdownStarted extends BallsPuzzleEvent {
  const BallsCountdownStarted();
}

class BallsCountdownTicked extends BallsPuzzleEvent {
  const BallsCountdownTicked();
}

class BallsCountdownStopped extends BallsPuzzleEvent {
  const BallsCountdownStopped();
}

class BallsCountdownReset extends BallsPuzzleEvent {
  const BallsCountdownReset({this.secondsToBegin});

  final int? secondsToBegin;

  @override
  List<Object?> get props => [secondsToBegin];
}

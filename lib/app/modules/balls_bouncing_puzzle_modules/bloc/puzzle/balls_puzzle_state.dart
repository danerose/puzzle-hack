
import 'package:equatable/equatable.dart';

/// The status of [BallsPuzzleState].
enum BallsPuzzleStatus {
  /// The puzzle is not started yet.
  notStarted,

  /// The puzzle is loading.
  loading,

  /// The puzzle is started.
  started
}

class BallsPuzzleState extends Equatable {
  const BallsPuzzleState({
    required this.secondsToBegin,
    this.isCountdownRunning = false,
  });

  /// Whether the countdown of this puzzle is currently running.
  final bool isCountdownRunning;

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  /// The status of the current puzzle.
  BallsPuzzleStatus get status => isCountdownRunning && secondsToBegin > 0
      ? BallsPuzzleStatus.loading
      : (secondsToBegin == 0
          ? BallsPuzzleStatus.started
          : BallsPuzzleStatus.notStarted);

  @override
  List<Object> get props => [isCountdownRunning, secondsToBegin];

  BallsPuzzleState copyWith({
    bool? isCountdownRunning,
    int? secondsToBegin,
  }) {
    return BallsPuzzleState(
      isCountdownRunning: isCountdownRunning ?? this.isCountdownRunning,
      secondsToBegin: secondsToBegin ?? this.secondsToBegin,
    );
  }
}

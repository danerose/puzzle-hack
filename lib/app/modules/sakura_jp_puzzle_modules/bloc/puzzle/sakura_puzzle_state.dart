
import 'package:equatable/equatable.dart';

/// The status of [SakuraPuzzleState].
enum SakuraPuzzleStatus {
  /// The puzzle is not started yet.
  notStarted,

  /// The puzzle is loading.
  loading,

  /// The puzzle is started.
  started
}

class SakuraPuzzleState extends Equatable {
  const SakuraPuzzleState({
    required this.secondsToBegin,
    this.isCountdownRunning = false,
  });

  /// Whether the countdown of this puzzle is currently running.
  final bool isCountdownRunning;

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  /// The status of the current puzzle.
  SakuraPuzzleStatus get status => isCountdownRunning && secondsToBegin > 0
      ? SakuraPuzzleStatus.loading
      : (secondsToBegin == 0
          ? SakuraPuzzleStatus.started
          : SakuraPuzzleStatus.notStarted);

  @override
  List<Object> get props => [isCountdownRunning, secondsToBegin];

  SakuraPuzzleState copyWith({
    bool? isCountdownRunning,
    int? secondsToBegin,
  }) {
    return SakuraPuzzleState(
      isCountdownRunning: isCountdownRunning ?? this.isCountdownRunning,
      secondsToBegin: secondsToBegin ?? this.secondsToBegin,
    );
  }
}

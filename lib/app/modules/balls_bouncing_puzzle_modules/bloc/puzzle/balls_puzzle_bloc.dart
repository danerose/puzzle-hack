


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/puzzle/balls_puzzle_event.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/puzzle/balls_puzzle_state.dart';

import 'package:puzzle_hack/core/data/models/ticker/ticker_model.dart';

class BallsPuzzleBloc
    extends Bloc<BallsPuzzleEvent, BallsPuzzleState> {
  /// {@macro Balls_puzzle_bloc}
  BallsPuzzleBloc({
    required this.secondsToBegin,
    required Ticker ticker,
  })  : _ticker = ticker,
        super(BallsPuzzleState(secondsToBegin: secondsToBegin)) {
    on<BallsCountdownStarted>(_onCountdownStarted);
    on<BallsCountdownTicked>(_onCountdownTicked);
    on<BallsCountdownStopped>(_onCountdownStopped);
    on<BallsCountdownReset>(_onCountdownReset);
  }

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _startTicker() {
    _tickerSubscription?.cancel();
    _tickerSubscription =
        _ticker.tick().listen((_) => add(const BallsCountdownTicked()));
  }

  void _onCountdownStarted(
    BallsCountdownStarted event,
    Emitter<BallsPuzzleState> emit,
  ) {
    _startTicker();
    emit(
      state.copyWith(
        isCountdownRunning: true,
        secondsToBegin: secondsToBegin,
      ),
    );
  }

  void _onCountdownTicked(
    BallsCountdownTicked event,
    Emitter<BallsPuzzleState> emit,
  ) {
    if (state.secondsToBegin == 0) {
      _tickerSubscription?.pause();
      emit(state.copyWith(isCountdownRunning: false));
    } else {
      emit(state.copyWith(secondsToBegin: state.secondsToBegin - 1));
    }
  }

  void _onCountdownStopped(
    BallsCountdownStopped event,
    Emitter<BallsPuzzleState> emit,
  ) {
    _tickerSubscription?.pause();
    emit(
      state.copyWith(
        isCountdownRunning: false,
        secondsToBegin: secondsToBegin,
      ),
    );
  }

  void _onCountdownReset(
    BallsCountdownReset event,
    Emitter<BallsPuzzleState> emit,
  ) {
    _startTicker();
    emit(
      state.copyWith(
        isCountdownRunning: true,
        secondsToBegin: event.secondsToBegin ?? secondsToBegin,
      ),
    );
  }
}




import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_event.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_state.dart';

import 'package:puzzle_hack/core/data/models/ticker/ticker_model.dart';

class SakuraPuzzleBloc
    extends Bloc<SakuraPuzzleEvent, SakuraPuzzleState> {
  /// {@macro Sakura_puzzle_bloc}
  SakuraPuzzleBloc({
    required this.secondsToBegin,
    required Ticker ticker,
  })  : _ticker = ticker,
        super(SakuraPuzzleState(secondsToBegin: secondsToBegin)) {
    on<SakuraCountdownStarted>(_onCountdownStarted);
    on<SakuraCountdownTicked>(_onCountdownTicked);
    on<SakuraCountdownStopped>(_onCountdownStopped);
    on<SakuraCountdownReset>(_onCountdownReset);
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
        _ticker.tick().listen((_) => add(const SakuraCountdownTicked()));
  }

  void _onCountdownStarted(
    SakuraCountdownStarted event,
    Emitter<SakuraPuzzleState> emit,
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
    SakuraCountdownTicked event,
    Emitter<SakuraPuzzleState> emit,
  ) {
    if (state.secondsToBegin == 0) {
      _tickerSubscription?.pause();
      emit(state.copyWith(isCountdownRunning: false));
    } else {
      emit(state.copyWith(secondsToBegin: state.secondsToBegin - 1));
    }
  }

  void _onCountdownStopped(
    SakuraCountdownStopped event,
    Emitter<SakuraPuzzleState> emit,
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
    SakuraCountdownReset event,
    Emitter<SakuraPuzzleState> emit,
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

//Dependencies
import 'package:bloc/bloc.dart';

//Bloc
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/theme/balls_theme_event.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/theme/balls_theme_state.dart';

//Theme
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/theme/balls_theme.dart';


class BallsThemeBloc extends Bloc<BallsThemeEvent, BallsThemeState> {
  BallsThemeBloc({required List<BallsTheme> themes})
      : super(BallsThemeState(themes: themes)) {
    on<BallsThemeChanged>(_onBallsThemeChanged);
  }

  void _onBallsThemeChanged(
    BallsThemeChanged event,
    Emitter<BallsThemeState> emit,
  ) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
  }
}

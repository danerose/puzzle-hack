import 'package:bloc/bloc.dart';

import 'package:puzzle_hack/core/theme/theme.dart';

//Part of
import 'package:puzzle_hack/core/bloc/theme/theme_event.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeState> {
  ThemeBloc({required CustomTheme customTheme}) : super(
    ThemeState(theme: customTheme),){
    on<ThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(
    ThemeChanged event,
    Emitter<ThemeState> emit,
  ){
    emit(state.copyWith(theme: event.theme));
  }
}

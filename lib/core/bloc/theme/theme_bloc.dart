
//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

//Theme
import 'package:puzzle_hack/core/theme/puzzle_theme.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_state.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({required List<PuzzleTheme> initialThemes})
      : super(ThemeState(themes: initialThemes)) {
    on<ThemeChanged>(_onThemeChanged);
    on<ThemeUpdated>(_onThemeUpdated);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
  }

  void _onThemeUpdated(ThemeUpdated event, Emitter<ThemeState> emit) {
    final themeIndex =
        state.themes.indexWhere((theme) => theme.name == event.theme.name);

    if (themeIndex != -1) {
      final newThemes = [...state.themes];
      newThemes[themeIndex] = event.theme;
      emit(
        state.copyWith(
          themes: newThemes,
          theme: event.theme,
        ),
      );
    }
  }
}

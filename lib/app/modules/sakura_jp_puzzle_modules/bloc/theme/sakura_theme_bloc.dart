//Dependencies
import 'package:bloc/bloc.dart';

//Bloc
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/theme/sakura_theme_event.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/theme/sakura_theme_state.dart';

//Theme
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/sakura_theme.dart';


class SakuraThemeBloc extends Bloc<SakuraThemeEvent, SakuraThemeState> {
  /// {@macro Sakura_theme_bloc}
  SakuraThemeBloc({required List<SakuraTheme> themes})
      : super(SakuraThemeState(themes: themes)) {
    on<SakuraThemeChanged>(_onSakuraThemeChanged);
  }

  void _onSakuraThemeChanged(
    SakuraThemeChanged event,
    Emitter<SakuraThemeState> emit,
  ) {
    emit(state.copyWith(theme: state.themes[event.themeIndex]));
  }
}

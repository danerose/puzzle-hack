//Dependencies
import 'package:equatable/equatable.dart';

//Model
import 'package:puzzle_hack/core/theme/puzzle_theme.dart';

//Theme
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/theme/modes/main_balls_theme.dart';
// import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/modes/main_sakura_theme.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.themes,
    this.theme = const MainBallsTheme(),
    // this.theme = const MainSakuraTheme(),
  });

  /// The list of all available themes.
  final List<PuzzleTheme> themes;

  /// Currently selected theme.
  final PuzzleTheme theme;

  @override
  List<Object> get props => [themes, theme];

  ThemeState copyWith({
    List<PuzzleTheme>? themes,
    PuzzleTheme? theme,
  }) {
    return ThemeState(
      themes: themes ?? this.themes,
      theme: theme ?? this.theme,
    );
  }
}

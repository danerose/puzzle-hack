import 'package:equatable/equatable.dart';

import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/theme/balls_theme.dart';

import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/theme/modes/main_balls_theme.dart';

class BallsThemeState extends Equatable {
  const BallsThemeState({
    required this.themes,
    this.theme = const MainBallsTheme(),
  });

  final List<BallsTheme> themes;
  final BallsTheme theme;

  @override
  List<Object> get props => [themes, theme];

  BallsThemeState copyWith({
    List<BallsTheme>? themes,
    BallsTheme? theme,
  }) {
    return BallsThemeState(
      themes: themes ?? this.themes,
      theme: theme ?? this.theme,
    );
  }
}

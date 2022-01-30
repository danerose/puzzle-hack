import 'package:equatable/equatable.dart';

import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/sakura_theme.dart';

import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/modes/main_sakura_theme.dart';

class SakuraThemeState extends Equatable {
  const SakuraThemeState({
    required this.themes,
    this.theme = const MainSakuraTheme(),
  });

  final List<SakuraTheme> themes;
  final SakuraTheme theme;

  @override
  List<Object> get props => [themes, theme];

  SakuraThemeState copyWith({
    List<SakuraTheme>? themes,
    SakuraTheme? theme,
  }) {
    return SakuraThemeState(
      themes: themes ?? this.themes,
      theme: theme ?? this.theme,
    );
  }
}

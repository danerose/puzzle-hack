
import 'package:equatable/equatable.dart';

import 'package:puzzle_hack/core/theme/theme.dart';
import 'package:puzzle_hack/core/theme/modes/blue_theme.dart';

class ThemeState extends Equatable {
  const ThemeState({
    this.theme = const BlueThemeData(),
  });


  /// Currently selected theme.
  final CustomTheme theme;

  @override
  List<Object> get props => [theme];

  ThemeState copyWith({
    CustomTheme? theme,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }
}

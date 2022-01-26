import 'package:equatable/equatable.dart';
import 'package:puzzle_hack/core/theme/theme.dart';


abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChanged extends ThemeEvent {
  const ThemeChanged({required this.theme});
  final CustomTheme theme;
  @override
  List<Object?> get props => [theme];
}

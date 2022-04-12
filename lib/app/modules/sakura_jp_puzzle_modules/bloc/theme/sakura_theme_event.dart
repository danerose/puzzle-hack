
import 'package:equatable/equatable.dart';

abstract class SakuraThemeEvent extends Equatable {
  const SakuraThemeEvent();
}

class SakuraThemeChanged extends SakuraThemeEvent {
  const SakuraThemeChanged({required this.themeIndex});

  final int themeIndex;

  @override
  List<Object> get props => [themeIndex];
}


import 'package:equatable/equatable.dart';

abstract class BallsThemeEvent extends Equatable {
  const BallsThemeEvent();
}

class BallsThemeChanged extends BallsThemeEvent {
  const BallsThemeChanged({required this.themeIndex});

  final int themeIndex;

  @override
  List<Object> get props => [themeIndex];
}

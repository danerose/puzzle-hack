//Flutter
import 'package:flutter/material.dart';

//Theme
import 'package:puzzle_hack/core/theme/puzzle_theme.dart';

//Layout
import 'package:puzzle_hack/core/layout/puzzle_layout_delegate.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/layout/balls_puzzle_layout_delegate.dart';

abstract class BallsTheme extends PuzzleTheme {
  const BallsTheme() : super ();

  @override
  String get name => 'Balls Puzzle';
  @override
  bool get hasTimer => true;
  @override
  PuzzleLayoutDelegate get layoutDelegate => const BallsPuzzleLayoutDelegate();

  String semanticsLabel(BuildContext context);
  String get audioAsset;
  String get themeAsset;
  
  @override
  List<Object?> get props => [
    name,
    hasTimer,
    layoutDelegate,
  ];
}

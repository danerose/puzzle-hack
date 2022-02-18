//Flutter
import 'package:flutter/material.dart';

//Theme
import 'package:puzzle_hack/core/theme/puzzle_theme.dart';

//Layout
import 'package:puzzle_hack/core/layout/puzzle_layout_delegate.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/layout/sakura_puzzle_layout_delegate.dart';

abstract class SakuraTheme extends PuzzleTheme {
  const SakuraTheme() : super ();

  @override
  String get name => 'Sakura Puzzle';
  @override
  bool get hasTimer => true;
  @override
  PuzzleLayoutDelegate get layoutDelegate => const SakuraPuzzleLayoutDelegate();

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

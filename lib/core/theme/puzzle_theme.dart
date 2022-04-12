//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:equatable/equatable.dart';

//Layout
import 'package:puzzle_hack/core/layout/puzzle_layout_delegate.dart';

abstract class PuzzleTheme extends Equatable{
  const PuzzleTheme();

  String get name;
  bool get hasTimer;
  ThemeData get themeData;
  PuzzleLayoutDelegate get layoutDelegate;

}

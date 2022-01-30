import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:puzzle_hack/core/layout/puzzle_layout_delegate.dart';

abstract class PuzzleTheme extends Equatable{
  const PuzzleTheme();

  String get name;
  bool get hasTimer;
  ThemeData get themeData;
  PuzzleLayoutDelegate get layoutDelegate;

}

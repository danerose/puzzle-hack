import 'package:flutter/material.dart';
import 'package:puzzle_hack/core/theme/theme.dart';


class PinkThemeData extends CustomTheme {
  const PinkThemeData() :super ();

  @override
  ThemeData get themeData => ThemeData(
  brightness: Brightness.light,
  backgroundColor: Colors.pink,
  scaffoldBackgroundColor: Colors.lime,
  colorScheme: const ColorScheme(
    primary: Colors.blueGrey, 
    primaryVariant: Colors.blueAccent, 
    secondary: Colors.lightBlue, 
    secondaryVariant: Colors.lightBlueAccent, 
    surface: Colors.deepPurple, 
    background: Colors.pink, 
    error: Colors.red, 
    onPrimary: Colors.yellow, 
    onSecondary: Colors.pink, 
    onSurface: Colors.lime, 
    onBackground: Colors.green, 
    onError: Colors.redAccent, 
    brightness: Brightness.light,
  ),
);

  @override
  List<Object?> get props => [themeData];
}

import 'package:flutter/material.dart';
import 'package:puzzle_hack/core/theme/theme.dart';


class BlueThemeData extends CustomTheme {
  const BlueThemeData() :super ();

  @override
  ThemeData get themeData => ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.lightBlue,
    colorScheme: const ColorScheme(
      primary: Colors.blueAccent, 
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

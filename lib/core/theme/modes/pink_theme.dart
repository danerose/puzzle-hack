//Flutter
import 'package:flutter/material.dart';

//Model

class PinkThemeData{
  const PinkThemeData() :super ();
  static ThemeData  themeData = ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.pink,
    scaffoldBackgroundColor: Colors.pink,
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
}

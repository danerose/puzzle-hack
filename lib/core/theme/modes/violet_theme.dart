//Flutter
import 'package:flutter/material.dart';


class VioletThemeData {
  const VioletThemeData() :super ();

  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFC8BBFC),
    scaffoldBackgroundColor: const Color(0xFFC8BBFC),
    colorScheme: const ColorScheme(
      primary: Color(0xFF382F63), 
      primaryVariant: Color(0xFF3D2241), 
      secondary: Color(0xFF632383), 
      secondaryVariant: Color(0xFF9C8CDC), 
      surface: Colors.deepPurple, 
      background: Colors.pink, 
      error: Colors.red, 
      onPrimary: Colors.white, 
      onSecondary: Colors.black,
      onSurface: Colors.deepPurple, 
      onBackground: Colors.green, 
      onError: Colors.redAccent, 
      brightness: Brightness.light,
    ),
  );  
}

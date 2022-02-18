//Flutter
import 'package:flutter/material.dart';

//Model

class PinkThemeData{
  const PinkThemeData() :super ();
  static ThemeData  themeData = ThemeData(
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFEBE2ED),
    scaffoldBackgroundColor: const  Color(0xFFEBE2ED),
    colorScheme: const ColorScheme(
      primary: Color(0xFFA05379), 
      primaryVariant: Color(0xFFFEB5D8), 
      secondary: Color(0xFFFF99E4), 
      secondaryVariant: Color(0xFFFFFFFF), 
      surface: Colors.deepPurple, 
      background: Colors.pink, 
      error: Colors.red, 
      onPrimary: Colors.black, 
      onSecondary: Color(0xFFE92E61), 
      onSurface: Colors.deepPurple, 
      onBackground: Colors.green, 
      onError: Colors.redAccent, 
      brightness: Brightness.light,
    ),
  );
}

//Flutter
import 'package:flutter/material.dart';



class MainThemeData {
  const MainThemeData() :super ();
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    backgroundColor:  const Color(0xFFDFD5C7),
    scaffoldBackgroundColor: const Color(0xFFDFD5C7),
    colorScheme: const ColorScheme(
      primary: Color(0xFFCE262D), 
      primaryVariant:  Color(0xFFD45461), 
      secondary: Color(0xFF3B3A35), 
      secondaryVariant: Color(0xFFD7B572), 
      surface: Color(0xFFCCCCCC), 
      background: Color(0xFFDFD5C7), 
      error: Color(0xFF790000), 
      onPrimary: Color(0xFFD45461), 
      onSecondary: Color(0xFFD7B572), 
      onSurface: Color(0xFFCCCCCC), 
      onBackground: Color(0xFFDFD5C7), 
      onError: Color(0xFF790000), 
      brightness: Brightness.light,
    ),
  );
}

//Flutter
import 'package:flutter/material.dart';



class MainThemeData {
  const MainThemeData() :super ();
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    backgroundColor:  const Color(0xFFDFD5C7),
    scaffoldBackgroundColor: const Color(0xFFDFD5C7),
    colorScheme: const ColorScheme(
      primary: Color(0xFF790000), 
      primaryContainer:  Color(0xFFCB242B), 
      secondary: Color(0xFFE15E6B), 
      secondaryContainer: Color(0xFFFCB9BF), 
      surface: Color(0xFFCCCCCC), 
      background: Color(0xFFDFD5C7), 
      error: Color(0xFFFF0000), 
      onPrimary: Color(0xFF2C251C), 
      onSecondary: Color(0xFF553900), 
      onSurface: Color(0xFFCCCCCC), 
      onBackground: Color(0xFFDFD5C7), 
      onError: Color(0xFF790000), 
      brightness: Brightness.light,
    ),
  );
}

//Flutter
import 'package:flutter/material.dart';

//Themes
import 'package:puzzle_hack/core/theme/modes/main_theme.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/theme/balls_theme.dart';

class MainBallsTheme extends BallsTheme{

  const MainBallsTheme() : super();


  @override
  String semanticsLabel(BuildContext context) {
    return 'Balls Main';
  }

  @override
  String get audioAsset => 'assets/audio/balls_theme.mp3';

  @override
  String get themeAsset => '';
  
  @override
  ThemeData get themeData => MainThemeData.themeData ;
 }

//Flutter
import 'package:flutter/material.dart';

//Themes
import 'package:puzzle_hack/core/theme/modes/violet_theme.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/theme/balls_theme.dart';

class MainBallsTheme extends BallsTheme{

  const MainBallsTheme() : super();


  @override
  String semanticsLabel(BuildContext context) {
    return 'Balls Dash';
  }

  @override
  String get audioAsset => 'assets/audio/skateboard.mp3';

  @override
  String get themeAsset => '';
  
  @override
  ThemeData get themeData => VioletThemeData.themeData ;
 }

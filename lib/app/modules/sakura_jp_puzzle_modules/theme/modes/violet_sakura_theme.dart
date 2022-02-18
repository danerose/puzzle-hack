//Flutter
import 'package:flutter/material.dart';

//Theme
import 'package:puzzle_hack/core/theme/modes/violet_theme.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/sakura_theme.dart';

class VioletSakuraTheme extends SakuraTheme{

  const VioletSakuraTheme() : super();


  @override
  String semanticsLabel(BuildContext context) {
    return 'Sakura Violet';
  }

  @override
  String get audioAsset => 'assets/audio/skateboard.mp3';

  @override
  String get themeAsset => 'assets/sakura/violet_sakura.png';
  
  @override
  ThemeData get themeData => VioletThemeData.themeData ;
 }

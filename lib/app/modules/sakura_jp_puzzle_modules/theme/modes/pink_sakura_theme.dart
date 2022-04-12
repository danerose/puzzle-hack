//Flutter
import 'package:flutter/material.dart';

//Theme
import 'package:puzzle_hack/core/theme/modes/pink_theme.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/sakura_theme.dart';

class PinkSakuraTheme extends SakuraTheme{

  const PinkSakuraTheme() : super();


  @override
  String semanticsLabel(BuildContext context) {
    return 'Sakura Pink';
  }

  @override
  String get audioAsset => 'assets/audio/sakura_theme.mp3';

  @override
  String get themeAsset => 'assets/sakura/pink_sakura.png';
  
  @override
  ThemeData get themeData => PinkThemeData.themeData ;
 }

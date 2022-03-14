//Flutter
import 'package:flutter/material.dart';

//Theme
import 'package:puzzle_hack/core/theme/modes/main_theme.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/sakura_theme.dart';

class MainSakuraTheme extends SakuraTheme{

  const MainSakuraTheme() : super();


  @override
  String semanticsLabel(BuildContext context) {
    return 'Sakura Main';
  }

  @override
  String get audioAsset => 'assets/audio/sakura_theme.mp3';

    @override
  String get themeAsset => 'assets/sakura/main_sakura.png';
  
  @override
  ThemeData get themeData => MainThemeData.themeData ;
 }

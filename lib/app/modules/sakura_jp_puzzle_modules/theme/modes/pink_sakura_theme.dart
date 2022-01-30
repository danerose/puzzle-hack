import 'package:flutter/material.dart';

import 'package:puzzle_hack/core/theme/modes/pink_theme.dart';

import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/sakura_theme.dart';

class PinkSakuraTheme extends SakuraTheme{

  const PinkSakuraTheme() : super();


  @override
  String semanticsLabel(BuildContext context) {
    return 'Sakura Dash';
  }

  @override
  String get audioAsset => 'assets/audio/skateboard.mp3';
  
  @override
  ThemeData get themeData => PinkThemeData.themeData ;
 }

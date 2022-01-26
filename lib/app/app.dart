// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.


//Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_bloc.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_state.dart';
import 'package:puzzle_hack/core/bloc/timer/timer_bloc.dart';
import 'package:puzzle_hack/core/data/models/ticker/ticker_model.dart';
import 'package:puzzle_hack/core/theme/modes/blue_theme.dart';

//Localizations
import 'package:puzzle_hack/l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//Views
import 'package:puzzle_hack/app/flows/home/view/home_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(
            customTheme: const BlueThemeData(),
          ),
        ),
        BlocProvider(
          create:(_) => TimerBloc(
            ticker: const Ticker(),
          ),
        ),
      ], 
      child: BlocBuilder<ThemeBloc, ThemeState>(
        buildWhen: (previus, current) => 
        previus.theme.themeData != current.theme.themeData,
        builder: (BuildContext context,ThemeState state) {
          return MaterialApp(
            theme: state.theme.themeData,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            home: const HomeView(),
          );
        },
      ),
    );
  }
}

// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.


//Flutte
import 'package:flutter/material.dart';


//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';



//Localizations
import 'package:puzzle_hack/l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


//Theme
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/modes/main_sakura_theme.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/modes/pink_sakura_theme.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/modes/violet_sakura_theme.dart';

import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/theme/modes/main_balls_theme.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/theme/modes/pink_balls_theme.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/theme/modes/violet_balls_theme.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/audio/audio_control_bloc.dart';

import 'package:puzzle_hack/core/bloc/particles/particles_bloc.dart';
import 'package:puzzle_hack/core/bloc/particles/particles_event.dart';

import 'package:puzzle_hack/core/bloc/puzzle/puzzle_bloc.dart';
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_event.dart';

import 'package:puzzle_hack/core/bloc/timer/timer_bloc.dart';

import 'package:puzzle_hack/core/bloc/theme/theme_bloc.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_state.dart';

import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/theme/sakura_theme_bloc.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_bloc.dart';

import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/theme/balls_theme_bloc.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/puzzle/balls_puzzle_bloc.dart';

//Model
import 'package:puzzle_hack/core/data/models/ticker/ticker_model.dart';

//Views
import 'package:puzzle_hack/app/flows/home/view/home_view.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BallsThemeBloc(
            themes: const [
              MainBallsTheme(),
              PinkBallsTheme(),
              VioletBallsTheme(),
            ],
          ),
        ),
        BlocProvider(
          create: (_) => SakuraThemeBloc(
            themes: const [
              MainSakuraTheme(),
              PinkSakuraTheme(),
              VioletSakuraTheme()
            ],
          ),
        ),
        BlocProvider(
          create: (_) => SakuraPuzzleBloc(
            secondsToBegin: 3,
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => BallsPuzzleBloc(
            secondsToBegin: 3,
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(
            initialThemes: [
              context.read<BallsThemeBloc>().state.theme,
              context.read<SakuraThemeBloc>().state.theme,
            ],
          ),
        ),
        BlocProvider(
          create: (_) => TimerBloc(
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => AudioControlBloc(),
        ),
        BlocProvider(
          create: (_) => PuzzleBloc(4)..add(
            const PuzzleInitialized(shufflePuzzle: false),
          ),
        ),
        BlocProvider(
          create: (_) => ParticlesBloc()..add(
            ParticlesInitialized(),
          ),
        ),
      ], 
      child: BlocBuilder<ThemeBloc, ThemeState>(
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

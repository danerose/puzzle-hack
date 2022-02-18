//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';


//Theme
import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_bloc.dart';
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_state.dart';

import 'package:puzzle_hack/core/bloc/theme/theme_bloc.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_state.dart';

//Widget

//View
import 'package:puzzle_hack/app/flows/home/view/components/header_component.dart';
import 'package:puzzle_hack/app/flows/home/view/components/section_component.dart';



class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration:  PuzzleThemeAnimationDuration.backgroundColorChange,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: const Home(
          key: Key('puzzle_view_puzzle'),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext _,BoxConstraints constraints) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (BuildContext _,ThemeState tState) {
            return BlocBuilder<PuzzleBloc, PuzzleState>(
              builder: (BuildContext _,PuzzleState pState) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          children: const [
                            HeaderComponent(),
                            SectionComponent()
                          ],
                        ),
                      ),
                    ),
                    tState.theme.layoutDelegate.themePickerBuilder(pState),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

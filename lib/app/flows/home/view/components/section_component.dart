//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle_hack/app/flows/home/view/widget/puzzle_board_widget.dart';


//Bloc
import 'package:puzzle_hack/core/bloc/theme/theme_bloc.dart';
import 'package:puzzle_hack/core/bloc/theme/theme_state.dart';

import 'package:puzzle_hack/core/bloc/puzzle/puzzle_bloc.dart';
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_state.dart';

//Component
import 'package:puzzle_hack/app/flows/home/view/components/menu_component.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';



class SectionComponent extends StatelessWidget {
  const SectionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context,ThemeState tState) {
        return BlocBuilder<PuzzleBloc, PuzzleState>(
          builder: (BuildContext context,PuzzleState pState) {
            return ResponsiveLayoutBuilder(
              small: (context, child) => Column(
                children: [
                  tState.theme.layoutDelegate.startSectionBuilder(pState),
                  const MenuComponent(),
                  const PuzzleBoardWidget(),
                  tState.theme.layoutDelegate.endSectionBuilder(pState),
                ],
              ),
              medium: (context, child) => Column(
                children: [
                  tState.theme.layoutDelegate.startSectionBuilder(pState),
                  const PuzzleBoardWidget(),
                  tState.theme.layoutDelegate.endSectionBuilder(pState),
                ],
              ),
              large: (context, child) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: tState.theme.layoutDelegate.startSectionBuilder(
                      pState,
                    ),
                  ),
                  const PuzzleBoardWidget(),
                  Expanded(
                    child: tState.theme.layoutDelegate.endSectionBuilder(
                      pState,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

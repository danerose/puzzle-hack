
//Flutter
import 'package:flutter/cupertino.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_state.dart';

//Models
import 'package:puzzle_hack/core/data/models/tile/tile.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_gap.dart';
import 'package:puzzle_hack/core/layout/puzzle_layout_delegate.dart';
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

//Components
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/widgets/balls_timer_widget.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/components/balls_coutdown_component.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/components/balls_puzzle_tile_component.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/components/balls_theme_picker_component.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/components/balls_puzzle_board_component.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/components/balls_start_section_component.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/components/balls_puzzle_action_button_component.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/components/balls_background_animation_component.dart';


class BallsPuzzleLayoutDelegate extends PuzzleLayoutDelegate {
  const BallsPuzzleLayoutDelegate();

  @override
  Widget startSectionBuilder(PuzzleState state) {
    return ResponsiveLayoutBuilder(
      small: (_, child) => child!,
      medium: (_, child) => child!,
      large: (_, child) => Padding(
        padding: const EdgeInsets.only(left: 50, right: 32),
        child: child,
      ),
      child: (_) => BallsStartSectionComponent(state: state),
    );
  }
  
  @override
  Widget endSectionBuilder(PuzzleState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const ResponsiveGap(
          small: 23,
          medium: 32,
        ),
        ResponsiveLayoutBuilder(
          small: (_, child) => const BallsPuzzleActionButtonComponent(),
          medium: (_, child) => const BallsPuzzleActionButtonComponent(),
          large: (_, __) => const SizedBox(),
        ),
        const ResponsiveGap(
          small: 32,
          medium: 54,
        ),
        ResponsiveLayoutBuilder(
          small: (_, child) => const BallsThemePickerComponent(),
          medium: (_, child) => const BallsThemePickerComponent(),
          large: (_, child) => const SizedBox(),
        ),
        const ResponsiveGap(
          small: 32,
          medium: 54,
        ),
        const ResponsiveGap(
          large: 130,
        ),
        const BallsCountdownComponent(),
      ],
    );
  }

  @override
  Widget themePickerBuilder(PuzzleState state) {
    return Positioned(
      bottom: 74,
      right: 50,
      child: ResponsiveLayoutBuilder(
        small: (_, child) => const SizedBox(),
        medium: (_, child) => const SizedBox(),
        large: (_, child) => const BallsThemePickerComponent(),
      ),
    );
  }

  @override
  Widget backgroundBuilder(PuzzleState state) {
    return const BallsBackgroundAnimationComponent();
  }

  @override
  Widget boardBuilder(int size, List<Widget> tiles) {
    return Stack(
      children: [
        Positioned(
          top: 24,
          left: 0,
          right: 0,
          child: ResponsiveLayoutBuilder(
            small: (_, child) => const SizedBox(),
            medium: (_, child) => const SizedBox(),
            large: (_, child) => const BallsTimerWidget(),
          ),
        ),
        Column(
          children: [
            const ResponsiveGap(
              small: 21,
              medium: 34,
              large: 96,
            ),
            BallsPuzzleBoardComponent(tiles: tiles),
            const ResponsiveGap(
              large: 96,
            ),
          ],
        ),
      ],
    );
  }



  @override
  Widget tileBuilder(Tile tile, PuzzleState state) {
    return BallsPuzzleTileComponent(tile: tile, state: state);
  }

  @override
  Widget whitespaceTileBuilder() {
    return const SizedBox();
  }
  
  @override
  List<Object?> get props => [];

}

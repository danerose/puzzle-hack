
import 'package:flutter/cupertino.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/components/sakura_coutdown_component.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/components/sakura_puzzle_action_button_component.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/components/sakura_puzzle_board_component.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/components/sakura_puzzle_tile_component.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/components/sakura_start_section_component.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/components/sakura_theme_picker_component.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/widgets/sakura_timer_widget.dart';
import 'package:puzzle_hack/core/data/models/tile/tile.dart';

import 'package:puzzle_hack/core/bloc/puzzle/puzzle_state.dart';

import 'package:puzzle_hack/core/layout/responsive_gap.dart';
import 'package:puzzle_hack/core/layout/puzzle_layout_delegate.dart';
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

class SakuraPuzzleLayoutDelegate extends PuzzleLayoutDelegate {
  const SakuraPuzzleLayoutDelegate();

  @override
  Widget startSectionBuilder(PuzzleState state) {
    return ResponsiveLayoutBuilder(
      small: (_, child) => child!,
      medium: (_, child) => child!,
      large: (_, child) => Padding(
        padding: const EdgeInsets.only(left: 50, right: 32),
        child: child,
      ),
      child: (_) => SakuraStartSectionComponent(state: state),
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
          small: (_, child) => const SakuraPuzzleActionButtonComponent(),
          medium: (_, child) => const SakuraPuzzleActionButtonComponent(),
          large: (_, __) => const SizedBox(),
        ),
        const ResponsiveGap(
          small: 32,
          medium: 54,
        ),
        ResponsiveLayoutBuilder(
          small: (_, child) => const SakuraThemePickerComponent(),
          medium: (_, child) => const SakuraThemePickerComponent(),
          large: (_, child) => const SizedBox(),
        ),
        const ResponsiveGap(
          small: 32,
          medium: 54,
        ),
        const ResponsiveGap(
          large: 130,
        ),
        const SakuraCountdownComponent(),
      ],
    );
  }

  @override
  Widget backgroundBuilder(PuzzleState state) {
    return Positioned(
      bottom: 74,
      right: 50,
      child: ResponsiveLayoutBuilder(
        small: (_, child) => const SizedBox(),
        medium: (_, child) => const SizedBox(),
        large: (_, child) => const SakuraThemePickerComponent(),
      ),
    );
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
            large: (_, child) => const SakuraTimerWidget(),
          ),
        ),
        Column(
          children: [
            const ResponsiveGap(
              small: 21,
              medium: 34,
              large: 96,
            ),
            SakuraPuzzleBoardComponent(tiles: tiles),
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
    return SakuraPuzzleTileComponent(tile: tile, state: state);
  }

  @override
  Widget whitespaceTileBuilder() {
    return const SizedBox();
  }
  
  @override
  List<Object?> get props => [];

}

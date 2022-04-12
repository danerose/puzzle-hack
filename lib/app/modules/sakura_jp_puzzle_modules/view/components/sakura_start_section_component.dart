//Flutters
import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';


//Bloc
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_state.dart';
import 'package:puzzle_hack/core/components/common/number_moves_tiles_left.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_bloc.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_state.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_gap.dart';
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

//Component
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/components/sakura_puzzle_action_button_component.dart';

//Widget
import 'package:puzzle_hack/core/widget/puzzle/puzzle_name.dart';
import 'package:puzzle_hack/core/widget/puzzle/puzzle_title.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/widgets/sakura_timer_widget.dart';


class SakuraStartSectionComponent extends StatelessWidget {
  const SakuraStartSectionComponent({
    Key? key,
    required this.state,
  }) : super(key: key);

  /// The state of the puzzle.
  final PuzzleState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ResponsiveGap(
          small: 20,
          medium: 83,
          large: 151,
        ),
        PuzzleName(
          key: GlobalKey(debugLabel: 'puzzle_name'),
        ),
        const ResponsiveGap(large: 16),
        PuzzleTitle(
          key: GlobalKey(debugLabel: 'puzzle_title'),
          title: 'Puzzle Challenge',
        ),
        const ResponsiveGap(
          small: 12,
          medium: 16,
          large: 32,
        ),
        BlocBuilder<SakuraPuzzleBloc, SakuraPuzzleState>(
          builder: (BuildContext context,SakuraPuzzleState sState) {
            return NumberOfMovesAndTilesLeft(
              key: GlobalKey(debugLabel: 'number_of_moves_and_tiles_left'),
              numberOfMoves: state.numberOfMoves,
              numberOfTilesLeft: sState.status == SakuraPuzzleStatus.started
                ? state.numberOfTilesLeft
                : state.puzzle.tiles.length - 1,
            );
          },
        ),
        const ResponsiveGap(
          small: 8,
          medium: 18,
          large: 32,
        ),
        ResponsiveLayoutBuilder(
          small: (_, __) => const SizedBox(),
          medium: (_, __) => const SizedBox(),
          large: (_, __) => const SakuraPuzzleActionButtonComponent(),
        ),
        ResponsiveLayoutBuilder(
          small: (_, __) => const SakuraTimerWidget(),
          medium: (_, __) => const SakuraTimerWidget(),
          large: (_, __) => const SizedBox(),
        ),
        const ResponsiveGap(small: 12),
      ],
    );
  }
}

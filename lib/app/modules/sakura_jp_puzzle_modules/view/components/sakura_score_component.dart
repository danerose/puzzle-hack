//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

//Helpers
import 'package:puzzle_hack/core/utils/helpers/text_helpers.dart';

//Theme
import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_gap.dart';
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_bloc.dart';
import 'package:puzzle_hack/core/bloc/puzzle/puzzle_state.dart';

//Component
import 'package:puzzle_hack/core/components/common/flutter_logo_component.dart';

//Widget
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/widgets/sakura_timer_widget.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/view/components/sakura_tree_animation_background_component.dart';

class SakuraScoreComponent extends StatelessWidget {
  const SakuraScoreComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, child) => child!,
      medium: (_, child) => child!,
      large: (_, child) => child!,
      child: (currentSize) {
        return ClipRRect(
          key: const Key('sakura_score'),
          borderRadius: BorderRadius.circular(22),
          child: Container(
            width: double.infinity,
            height: currentSize == ResponsiveLayoutSize.small ? 374.0 : 355.0,
            color: Theme.of(context).backgroundColor,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: currentSize == ResponsiveLayoutSize.small
                     ? 374.0 : 355.0,
                    child: const SakuraTreeAnimation(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FlutterLogoComponent(
                        height: 24,
                        isColored: false,
                      ),
                      const ResponsiveGap(
                        small: 24,
                        medium: 32,
                        large: 32,
                      ),
                      SizedBox(
                        key: const Key('sakura_score_completed'),
                        width: currentSize == ResponsiveLayoutSize.small 
                          ? 160.0 : double.infinity,
                        child: const AnimatedDefaultTextStyle(
                          style: TextStyle(),
                          duration: PuzzleThemeAnimationDuration.textStyle,
                          child: Text('Puzzle challenge completed',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const ResponsiveGap(
                        small: 8,
                        medium: 16,
                        large: 16,
                      ),
                      const AnimatedDefaultTextStyle(
                        key: Key('sakura_score_well_done'),
                        style: TextStyle(),
                        duration: PuzzleThemeAnimationDuration.textStyle,
                        child: Text('Well done.\nCongrats!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const ResponsiveGap(
                        small: 24,
                        medium: 32,
                        large: 32,
                      ),
                      const AnimatedDefaultTextStyle(
                        key: Key('sakura_score_score'),
                        style: TextStyle(),
                        duration: PuzzleThemeAnimationDuration.textStyle,
                        child: Text('Score',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),                        
                        ),
                      ),
                      const ResponsiveGap(
                        small: 8,
                        medium: 9,
                        large: 9,
                      ),
                      SakuraTimerWidget(
                        textStyle: const TextStyle(),
                        iconSize: currentSize == ResponsiveLayoutSize.small
                          ? const Size(21, 21)
                          : const Size(28, 28),
                        iconPadding: currentSize == ResponsiveLayoutSize.small 
                          ? 4.0 : 6.0,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      const ResponsiveGap(
                        small: 2,
                        medium: 8,
                        large: 8,
                      ),
                      BlocBuilder<PuzzleBloc, PuzzleState>(
                        builder: (BuildContext _,PuzzleState state) {
                          return AnimatedDefaultTextStyle(
                            key: const Key('sakura_score_number_of_moves'),
                            style: const TextStyle(),
                            duration: PuzzleThemeAnimationDuration.textStyle,
                            child: Text(
                              TextHelper.successNumberOfMoves(
                                state.numberOfMoves.toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

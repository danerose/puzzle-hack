//Flutter
import 'package:flutter/material.dart';

//Dependencies

//Bloc

//Theme
import 'package:puzzle_hack/core/theme/puzzle_theme_animations.dart';

//Helper
import 'package:puzzle_hack/core/utils/helpers/text_helpers.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';



class NumberOfMovesAndTilesLeft extends StatelessWidget {
  const NumberOfMovesAndTilesLeft({
    Key? key,
    required this.numberOfMoves,
    required this.numberOfTilesLeft,
    this.color,
  }) : super(key: key);

  final int numberOfMoves;
  final int numberOfTilesLeft;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (context, child) => Center(child: child),
      medium: (context, child) => Center(child: child),
      large: (context, child) => child!,
      child: (currentSize) {
        return Semantics(
          label: TextHelper.puzzleNumberOfMovesAndTilesLeftLabelText(
            numberOfMoves.toString(),
            numberOfTilesLeft.toString(),
          ),
          child: ExcludeSemantics(
            child: Row(
              key: const Key('number_of_moves_and_tiles_left'),
              mainAxisAlignment:  currentSize == ResponsiveLayoutSize.large
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                AnimatedDefaultTextStyle(
                  key: const Key('number_of_moves_and_tiles_left_moves'),
                  style: const TextStyle(),
                  duration: PuzzleThemeAnimationDuration.textStyle,
                  child: Text(numberOfMoves.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: currentSize == ResponsiveLayoutSize.large
                      ? 28 : 20,
                    ),                 
                  ),
                ),
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: currentSize == ResponsiveLayoutSize.large
                    ? 28 : 20,                   
                  ),
                  duration: PuzzleThemeAnimationDuration.textStyle,
                  child: Text(' Moves | ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: currentSize == ResponsiveLayoutSize.large
                      ? 26 : 18,
                    ),                   
                  ),
                ),
                AnimatedDefaultTextStyle(
                  key: const Key('number_of_moves_and_tiles_left_tiles_left'),
                  style: const TextStyle(),
                  duration: PuzzleThemeAnimationDuration.textStyle,
                  child: Text(numberOfTilesLeft.toString(),          
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: currentSize == ResponsiveLayoutSize.large
                      ? 28 : 20,
                    ),                  
                  ),
                ),
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: currentSize == ResponsiveLayoutSize.large
                    ? 28 : 20,
                  ),
                  duration: PuzzleThemeAnimationDuration.textStyle,
                  child: Text(' Tiles',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: currentSize == ResponsiveLayoutSize.large
                      ? 26 : 18,
                    ),                 
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

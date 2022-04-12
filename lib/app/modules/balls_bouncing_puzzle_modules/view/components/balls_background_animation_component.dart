//Flutter
import 'dart:math';

import 'package:flutter/material.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

//Widgets
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/widgets/balls_animation_widget.dart';

class BallsBackgroundAnimationComponent extends StatelessWidget {
  const BallsBackgroundAnimationComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (BuildContext _, Widget? child) => child!, 
      medium: (BuildContext _, Widget? child) => child!, 
      large: (BuildContext _, Widget? child) => child!,
      child: (currentSize) {
        return Stack(
          children: [
            BallsAnimationWidget(
              globalKey: GlobalKey(),
              size: currentSize == ResponsiveLayoutSize.large 
              ? Random().nextInt(99).toDouble() * 6 
              : Random().nextInt(99).toDouble() * 2,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.secondaryContainer,
              ], 
              color: Random().nextInt(4), 
              x: Random().nextInt(99).toDouble() * Random().nextInt(50), 
              y: Random().nextInt(99).toDouble() * Random().nextInt(50), 
              changeOnLimit: true,
            ),
            BallsAnimationWidget(
              globalKey: GlobalKey(),
              size: currentSize == ResponsiveLayoutSize.large 
              ? Random().nextInt(99).toDouble() *  10 
              : Random().nextInt(99).toDouble() +  50,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.secondaryContainer
              ], 
              color: Random().nextInt(4), 
              x: Random().nextInt(99).toDouble() * 4, 
              y: Random().nextInt(99).toDouble() * 4, 
              changeOnLimit: true,
            ),
            BallsAnimationWidget(
              globalKey: GlobalKey(),
              size: currentSize == ResponsiveLayoutSize.large 
              ? Random().nextInt(99).toDouble() *  10 
              : Random().nextInt(99).toDouble() +  50,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.secondaryContainer,
              ], 
              color: Random().nextInt(4), 
              x: Random().nextInt(99).toDouble() * 4, 
              y: Random().nextInt(99).toDouble() * 4, 
              changeOnLimit: true,
            ),
          ],
        );
      },
    );
  }
}

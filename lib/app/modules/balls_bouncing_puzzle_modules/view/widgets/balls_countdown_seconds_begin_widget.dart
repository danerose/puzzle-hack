//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/theme/balls_theme_bloc.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/theme/balls_theme_state.dart';


//Extensions

//Widgets


class BallsCountdownSecondsToBeginWidget extends StatefulWidget {
  /// {@macro Balls_countdown_seconds_to_begin}
  const BallsCountdownSecondsToBeginWidget({
    Key? key,
    required this.secondsToBegin,
  }) : super(key: key);

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  @override
  State<BallsCountdownSecondsToBeginWidget> createState() =>
      _BallsCountdownSecondsToBeginWidgetState();
}

class _BallsCountdownSecondsToBeginWidgetState
    extends State<BallsCountdownSecondsToBeginWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> inOpacity;
  late Animation<double> inScale;
  late Animation<double> outOpacity;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    inOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.58, curve: Curves.decelerate),
      ),
    );
    inScale = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.58, curve: Curves.decelerate),
      ),
    );
    outOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.81, 1, curve: Curves.easeIn),
      ),
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BallsThemeBloc, BallsThemeState>(
      builder: (BuildContext context,BallsThemeState state) {
        return FadeTransition(
          opacity: outOpacity,
          child: FadeTransition(
            opacity: inOpacity,
            child: ScaleTransition(
              scale: inScale,
              child: Text(
                widget.secondsToBegin.toString(),
                style: TextStyle(
                  fontSize: 50,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

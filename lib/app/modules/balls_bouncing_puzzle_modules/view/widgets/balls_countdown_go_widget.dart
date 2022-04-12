//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/theme/balls_theme_bloc.dart';
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/bloc/theme/balls_theme_state.dart';



//Extensions

//Widgets


@visibleForTesting
class BallsCountdownGoWidget extends StatefulWidget {
  const BallsCountdownGoWidget({Key? key}) : super(key: key);

  @override
  State<BallsCountdownGoWidget> createState() =>
  _BallCountdownGoWidgetState();
}

class _BallCountdownGoWidgetState extends State<BallsCountdownGoWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> inOpacity;
  late Animation<double> inScale;
  late Animation<double> outScale;
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
        curve: const Interval(0, 0.37, curve: Curves.decelerate),
      ),
    );
    inScale = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.37, curve: Curves.decelerate),
      ),
    );
    outOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.63, 1, curve: Curves.easeIn),
      ),
    );
    outScale = Tween<double>(begin: 1, end: 1.5).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.63, 1, curve: Curves.easeIn),
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
        return Padding(
          padding: const EdgeInsets.only(top: 101),
          child: FadeTransition(
            opacity: outOpacity,
            child: FadeTransition(
              opacity: inOpacity,
              child: ScaleTransition(
                scale: outScale,
                child: ScaleTransition(
                  scale: inScale,
                  child: Text(
                    'GO!',
                    style: TextStyle(
                      fontSize: 100,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

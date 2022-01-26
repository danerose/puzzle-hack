//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

//Blox
import 'package:puzzle_hack/app/flows/counter/counter.dart';

class CounterText extends StatelessWidget {
  const CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.headline1);
  }
}

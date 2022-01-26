// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/app/flows/counter/counter.dart';

//Localizations


//Component
import 'package:puzzle_hack/app/flows/counter/view/components/counter_controls_component.dart';


class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterControlsComponent(),
    );
  }
}

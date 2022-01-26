//Flutter
import 'package:flutter/material.dart';


//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

//Bloc
import 'package:puzzle_hack/app/flows/counter/counter.dart';

//Localizations
import 'package:puzzle_hack/l10n/l10n.dart';

//widget
import 'package:puzzle_hack/app/flows/counter/view/widget/counter_text_widget.dart';

class CounterControlsComponent extends StatelessWidget {
  const CounterControlsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

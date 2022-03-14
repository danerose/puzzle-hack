//Flutter

import 'package:flutter/material.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/modes/main_sakura_theme.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/theme/modes/pink_sakura_theme.dart';

import 'package:rive/rive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/theme/sakura_theme_state.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/theme/sakura_theme_bloc.dart';


class SakuraTreeAnimation extends StatefulWidget {
  const SakuraTreeAnimation({
    Key? key,
    required this.size,
  }) : super(key: key);

  final ResponsiveLayoutSize size;

  @override
  State<SakuraTreeAnimation> createState() => _SakuraTreeAnimationState();
}

class _SakuraTreeAnimationState extends State<SakuraTreeAnimation> {


  late SMIInput? _input;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SakuraThemeBloc, SakuraThemeState>(
      listener: (BuildContext context,SakuraThemeState state) {
        if(state.theme == const MainSakuraTheme()){
          setState(() => _input?.value = 0);
        }else if(state.theme == const PinkSakuraTheme()){
          setState(() => _input?.value = 1);
        }else{
          setState(() => _input?.value = 2);
        }
      },
      child: SizedBox(
          child: RiveAnimation.asset(
            'assets/rive/sakura_animation.riv',
            fit: widget.size == ResponsiveLayoutSize.large 
              ? BoxFit.cover : widget.size == ResponsiveLayoutSize.medium ? 
              BoxFit.cover : BoxFit.fitHeight,
            onInit: _onRiveInit,
          ),
        ),
    );
  }
  void _onRiveInit(Artboard artboard) {
    final _controller = StateMachineController.fromArtboard(
      artboard, 'StateTree',
    );
    artboard.addController(_controller!);
    _input = _controller.inputs.first;
  }

}

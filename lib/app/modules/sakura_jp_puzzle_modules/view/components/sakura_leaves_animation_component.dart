//Flutter
// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

//Dependencies
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:puzzle_hack/core/bloc/particles/particles_bloc.dart';
import 'package:puzzle_hack/core/bloc/particles/particles_state.dart';

//Bloc
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_state.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/bloc/puzzle/sakura_puzzle_bloc.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

//Components
// import 'package:puzzle_hack/core/components/painter/particles_painter_component.dart';
import 'package:puzzle_hack/core/components/painter/particles_painter_in_out_component.dart';
import 'package:puzzle_hack/core/components/painter/particles_painter_out_in_component.dart';


class SakuraLeavesAnimation extends StatelessWidget {
  const SakuraLeavesAnimation({
    Key? key,
    required this.size,
  }) : super(key: key);

  final ResponsiveLayoutSize  size;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SakuraPuzzleBloc,SakuraPuzzleState>(
      builder: (BuildContext context, SakuraPuzzleState sakuraState){
        return BlocBuilder<ParticlesBloc,ParticlesState>(
          buildWhen: (p,c) => p.particleAnimation != c.particleAnimation,
          builder: (BuildContext context, ParticlesState particlesState){
            if(sakuraState.status == SakuraPuzzleStatus.started
              && particlesState.animate
            ){
              // return Stack(
              //   children: [
              //     ParticlesPainterComponent(
              //       colors: [
              //         Theme.of(context).colorScheme.primary,
              //         Theme.of(context).colorScheme.primaryVariant,
              //         Theme.of(context).colorScheme.secondary,
              //         Theme.of(context).colorScheme.secondaryVariant,
              //       ],
              //       initX: particlesState.initX, 
              //       initY: particlesState.initY, 
              //       endX: particlesState.endX, 
              //       endY: particlesState.endY,
              //     ),
              //   ],
              // );
              if(particlesState.particleAnimation == ParticleAnimation.animateInOut ){
                return Stack(
                  children: [
                    ParticlesPainterInOutComponent(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primaryVariant,
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.secondaryVariant,
                      ],
                      initX: particlesState.initX, 
                      initY: particlesState.initY, 
                      endX: 1000, 
                      endY: 1000,
                      spray: size == ResponsiveLayoutSize.small ? 400 
                      : size == ResponsiveLayoutSize.medium ? 1000 : 1400,
                    ),
                  ],
                );
              }else{
                return Stack(
                  children: [
                    ParticlesPainterOutInComponent(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primaryVariant,
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.secondaryVariant,
                      ],
                      initX: particlesState.endX, 
                      initY: particlesState.initY, 
                      endX: particlesState.endX, 
                      endY: particlesState.endY,
                      spray: size == ResponsiveLayoutSize.small ? 100 
                      : size == ResponsiveLayoutSize.medium ? 200 : 600,
                    ),
                  ],
                );
              }
            }else{
              return const SizedBox();
            }
          },
        );
      },
    );
  }
}

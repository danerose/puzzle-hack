    // ResponsiveLayoutBuilder(
    //   small: (BuildContext _, Widget? child) {
    //     return RiveAnimation.asset(
    //       'assets/rive/sakura_lamp_animation.riv',
    //       artboard: 'Tree Small',
    //       fit: BoxFit.fitHeight,

    //     );
    //   }, 
    //   medium: (BuildContext _, Widget? child) {
    //     return RiveAnimation.asset(
    //       'assets/rive/sakura_lamp_animation.riv',
    //       artboard: 'Tree Small',
    //       fit: BoxFit.fitHeight,
      
    //     );
    //   },
    //   large: (BuildContext _, Widget? child) {

    //     return RiveAnimation.asset(
    //       'assets/rive/sakura_lamp_animation.riv',
    //       artboard: 'Tree Large',
    //       fit: BoxFit.cover,
    //     );
    //   },
    // ),
    // BlocBuilder<ParticlesBloc,ParticlesState>(
    //   buildWhen: (prev,ctx) => prev.endX != ctx.endX 
    //     && prev.initX != ctx.initX,
    //   builder: (BuildContext context, ParticlesState state){
    //     if(state.animate){
    //       return PainterComponent(
    //         colors: [
    //           Theme.of(context).colorScheme.primary,
    //           Theme.of(context).colorScheme.primaryVariant,
    //           Theme.of(context).colorScheme.secondary,
    //           Theme.of(context).colorScheme.secondaryVariant,
    //         ],
    //         endX: state.endX, 
    //         endY: state.endY, 
    //         initX: state.initX, 
    //         initY: state.initY,
    //       );
    //     }else{
    //       return const SizedBox();
    //     }
    //   },
    // ),

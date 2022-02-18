import 'package:equatable/equatable.dart';


abstract class ParticlesEvent extends Equatable{
  const ParticlesEvent();
  @override
  List<Object?> get props => [];
}


class ParticlesInitialized extends ParticlesEvent {}

class ParticlesActiveDisabled extends ParticlesEvent {
  const ParticlesActiveDisabled({required this.activeOrDisabled});
  final bool activeOrDisabled;
}

class ParticlesAnimation extends ParticlesEvent {
  const ParticlesAnimation({
    required this.animate, 
    required this.initX, 
    required this.initY, 
    required this.endX, 
    required this.endY,
  });

  final bool animate;
  final double initX;
  final double initY;
  final double endX;
  final double endY; 

  @override
  List<Object?> get props => [
    animate,
    initX,
    initY,
    endX,
    endY,
  ];
}
class ParticlesInitAnimation extends ParticlesEvent {
  const ParticlesInitAnimation({
    required this.animate, 
    required this.initX, 
    required this.initY, 
  });

  final bool animate;
  final double initX;
  final double initY;


  @override
  List<Object?> get props => [
    animate,
    initX,
    initY,
  ];
}

class ParticlesEndAnimation extends ParticlesEvent {
  const ParticlesEndAnimation({
    required this.animate, 
    required this.endX, 
    required this.endY,
  });

  final bool animate;
  final double endX;
  final double endY; 

  @override
  List<Object?> get props => [
    animate,
    endX,
    endY,
  ];
}

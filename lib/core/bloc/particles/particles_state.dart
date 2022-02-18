import 'package:equatable/equatable.dart';

class ParticlesState extends Equatable {
  const ParticlesState({
    this.animate = false,
    this.initX = 0,
    this.initY = 0,
    this.endX = 0,
    this.endY = 0,
    this.lastX = 0,
    this.lastY = 0,
  });

  final bool animate;
  final double initX;
  final double initY;
  final double endX;
  final double endY;
  final double lastX;
  final double lastY;


  ParticlesState copyWith({
    bool? animate,
    double? initX,
    double? initY,
    double? endX,
    double? endY,
    double? lastX,
    double? lastY,
  }) {
    return ParticlesState(
      animate: animate ?? this.animate,
      initX: initX ?? this.initX,
      initY: initY ?? this.initY,
      endX: endX ?? this.endX,
      endY: endY ?? this.endY,
      lastX: lastX ?? this.lastX,
      lastY: lastY ?? this.lastY,
    );
  }

  @override
  List<Object?> get props => [
    animate,
    initX,
    initY,
    endX,
    endY,
    lastX,
    lastY
  ];
}

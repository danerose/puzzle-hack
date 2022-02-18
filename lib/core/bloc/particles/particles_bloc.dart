

//Dependencies
import 'package:bloc/bloc.dart';

//Bloc
import 'package:puzzle_hack/core/bloc/particles/particles_event.dart';
import 'package:puzzle_hack/core/bloc/particles/particles_state.dart';

class ParticlesBloc extends Bloc<ParticlesEvent, ParticlesState>{

  ParticlesBloc() : super(const ParticlesState()){
    on<ParticlesInitialized>(_onParticlesInitialized);
    on<ParticlesActiveDisabled>(_onParticlesParticlesActiveDisabled);
    on<ParticlesAnimation>(_onParticlesAnimation);
    on<ParticlesInitAnimation>(_onParticlesInitAnimation);
    on<ParticlesEndAnimation>(_onParticlesEndAnimation);
  }

  void _onParticlesParticlesActiveDisabled(
    ParticlesActiveDisabled event,
    Emitter<ParticlesState> emit,
  ){
    emit(state.copyWith(animate: event.activeOrDisabled));
  }

  void _onParticlesInitialized(
    ParticlesInitialized event,
    Emitter<ParticlesState> emit,
  ){
    emit(state.copyWith(
      animate: false,
      endX: 0,
      endY: 0,
      initX: 0,
      initY: 0,
    ),);
  }

  void _onParticlesAnimation(
    ParticlesAnimation event,
    Emitter<ParticlesState> emit,
  ){
    emit(state.copyWith(
      animate: event.animate,
      initX: event.initX,
      initY: event.initY,
      endX: event.endX,
      endY: event.endY,
    ),);
  }

  void _onParticlesInitAnimation(
    ParticlesInitAnimation event,
    Emitter<ParticlesState> emit,
  ){
    emit(state.copyWith(
      animate: event.animate,
      initX: event.initX,
      initY: event.initY,
      endX: event.initX + 10,
      endY: event.initY + 10,
      lastX: event.initX + 10,
      lastY: event.initY + 10,
    ),);
  }

  void _onParticlesEndAnimation(
    ParticlesEndAnimation event,
    Emitter<ParticlesState> emit,
  ){
    emit(state.copyWith(
      animate: event.animate,
      initX: state.lastX,
      initY: state.lastY,
      endX: event.endX,
      endY: event.endY,
    ),);
  }

}

part of 'mode_cubit.dart';

abstract class ModeState extends Equatable {
  const ModeState();

  @override
  List<Object> get props => [];
}

class ModeInitial extends ModeState {}

class IsDarkState extends ModeState {
  IsDarkState();

  @override
  List<Object> get props => [];
}

class IsLightState extends ModeState {
  IsLightState();

  @override
  List<Object> get props => [];
}

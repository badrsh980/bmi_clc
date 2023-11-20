part of 'bmi_bloc.dart';

@immutable
abstract class BmiState {}

class BmiInitial extends BmiState {}

class BmiCalculated extends BmiState {
  final double bmi;

  BmiCalculated(this.bmi);
}

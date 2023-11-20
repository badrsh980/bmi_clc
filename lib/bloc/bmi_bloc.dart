import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();

  BmiBloc() : super(BmiInitial()) {
    on<Bmiclc>((event, emit) {
      final bmi = calculateBMI();
      emit(BmiCalculated(bmi));
    });
  }

  double calculateBMI() {
    double num1 = double.tryParse(number1Controller.text) ?? 0.0;
    double num2 = double.tryParse(number2Controller.text) ?? 1.0;
    return num1 / pow((num2 / 100), 2);
  }

  Color getColorForBMI(double bmi) {
    if (bmi < 18.5) {
      return Colors.green;
    } else if (bmi >= 18.5 && bmi <= 25) {
      return Colors.green;
    } else if (bmi > 25 && bmi <= 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}

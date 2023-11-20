import 'package:bmi_clc/bloc/bmi_bloc.dart';
import 'package:bmi_clc/costoms/button.dart';
import 'package:bmi_clc/costoms/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => BmiBloc(),
      child: MainApp(),
    ),
  );
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromRGBO(24, 24, 32, 1),
      ),
      home: BlocProvider(
        create: (context) => BmiBloc(),
        child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<BmiBloc, BmiState>(
                  builder: (context, state) {
                    final bmiBloc = BlocProvider.of<BmiBloc>(context);
                    return Column(
                      children: [
                        if (state is BmiCalculated)
                          Container(
                            decoration: BoxDecoration(
                              color: bmiBloc.getColorForBMI(
                                (state.bmi),
                              ),
                            ),
                            child: Text(
                              "BMI number: ${(state.bmi)}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        const SizedBox(height: 20),
                        LoginField(
                          hintText: 'Weight In kg',
                          iconData: Icons.cloud_circle_outlined,
                          controller: bmiBloc.number1Controller,
                        ),
                        const SizedBox(height: 15),
                        LoginField(
                          hintText: 'Height in cm',
                          iconData: Icons.cloud_circle_outlined,
                          controller: bmiBloc.number2Controller,
                        ),
                        const SizedBox(height: 15),
                        LoginButton(
                          label: "BMi",
                          onPressed: () {
                            bmiBloc.add(Bmiclc());
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

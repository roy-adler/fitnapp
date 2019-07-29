import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/Data/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FitnessPlanAdd extends StatelessWidget {
  Function() setStateFunction;

  FitnessPlanAdd({this.setStateFunction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        previousPageTitle: "Overview",
        middle: Text("Add Fitnessplan"),
      ),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            Data.addFitnessPlan(FitnessPlan(
              title: "Hello" + Random().nextInt(1982).toString(),
            ));
            Navigator.maybePop(context);
            setStateFunction();
          },
        ),
      ),
    );
  }
}

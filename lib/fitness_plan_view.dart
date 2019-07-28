import 'package:fitnapp/exercise.dart';
import 'package:fitnapp/fitness_plan.dart';
import 'package:flutter/material.dart';
import 'package:statusbar/statusbar.dart';

class FitnessPlanView extends StatelessWidget {
  FitnessPlan fitnessPlan;

  FitnessPlanView(this.fitnessPlan);

  @override
  Widget build(BuildContext context) {
    StatusBar.color(Color.fromRGBO(255, 0, 0, 0.0));
    return Scaffold(
      appBar: AppBar(
        title: Text(fitnessPlan.title),
      ),
      body: ListView.builder(
          itemCount: fitnessPlan.exerciseList.length,
          itemBuilder: (context, index) => fitnessPlan.exerciseList[index]),
    );
  }
}

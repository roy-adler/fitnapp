import 'package:fitnapp/exercise.dart';
import 'package:fitnapp/fitness_plan.dart';
import 'package:flutter/material.dart';
import 'package:statusbar/statusbar.dart';

class FitnessPlanListView extends StatelessWidget {
  List<FitnessPlan> _fitnessPlanList = [
    FitnessPlan(
      title: 'Penis',
      exerciseList: [
        Exercise(
          title: 'Pipi',
          reps: 4,
        )
      ],
    ),
    FitnessPlan(
      title: 'Penis 2 oder sp',
      exerciseList: [
        Exercise(
          title: 'Foclo',
        )
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    StatusBar.color(Color.fromRGBO(255, 0, 0, 0.0));
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: ListView.builder(
          itemCount: _fitnessPlanList.length,
          itemBuilder: (context, index) => _fitnessPlanList[index]),
    );
  }
}

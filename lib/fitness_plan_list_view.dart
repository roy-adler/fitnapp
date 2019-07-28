import 'package:fitnapp/exercise.dart';
import 'package:fitnapp/fitness_plan.dart';
import 'package:flutter/material.dart';
import 'package:statusbar/statusbar.dart';
import 'package:flutter/cupertino.dart';

class FitnessPlanListView extends StatelessWidget {
  List<FitnessPlan> _fitnessPlanList = [
    FitnessPlan(
      title: 'Fitnessplan 1',
      exerciseList: [
        Exercise(title: 'Exercise 1', reps: 4),
      ],
    ),
    FitnessPlan(
      title: 'Fitnessplan 2',
      exerciseList: [
        Exercise(title: 'Exercise 1'),
        Exercise(title: 'Exercise 2'),
        Exercise(title: 'Exercise 3'),
        Exercise(title: 'Exercise 4'),
        Exercise(title: 'Exercise 5', weight: 24),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    StatusBar.color(Color.fromRGBO(255, 0, 0, 0.0));
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Home"),
      ),
      body: ListView.builder(
          itemCount: _fitnessPlanList.length,
          itemBuilder: (context, index) => _fitnessPlanList[index]),
    );
  }
}

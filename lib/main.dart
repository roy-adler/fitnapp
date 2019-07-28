import 'package:fitnapp/fitness_plan.dart';
import 'package:fitnapp/fitness_plan_list_view.dart';
import 'package:flutter/material.dart';
import 'package:statusbar/statusbar.dart';

import 'exercise.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    StatusBar.color(Color.fromRGBO(255, 0, 0, 0.0));
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: FitnessPlanListView(fitnessPlanList: loadFitnessplanList()),
      ),
    );
  }

  List<FitnessPlan> loadFitnessplanList() {
    return [
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
  }
}

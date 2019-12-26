import 'package:fitnapp/App/Exercise/exercise.dart';
import 'package:fitnapp/App/Fitness/fitness_plan_view.dart';
import 'package:fitnapp/Data/Data.dart';
import 'package:flutter/material.dart';

class FitnessPlan extends StatelessWidget {
  String title;
  List<Exercise> exerciseList;

  FitnessPlan({@required this.title, this.exerciseList});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FitnessPlanView(
            FitnessPlan(title: title, exerciseList: exerciseList),
          ),
        ),
      ),
    );
  }
}

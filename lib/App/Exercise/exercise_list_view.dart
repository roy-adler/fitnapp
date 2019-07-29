import 'package:fitnapp/App/Exercise/exercise_view.dart';
import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/Data/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseListView extends StatelessWidget {
  FitnessPlan fitnessPlan;

  ExerciseListView({@required this.fitnessPlan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        //previousPageTitle: "Exercises",
        middle: Text("ExerciseList"),
      ),
      body: ListView.builder(
        itemCount: Data.exerciseList().length,
        itemBuilder: (context, index) => ListTile(
          title: Text(Data.exerciseList()[index].title),
          trailing: CupertinoButton(
            child: Text('Detail'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ExerciseView(exercise: Data.exerciseList()[index]),
              ),
            ),
          ),
          // TODO: Add Exercise to FitnessPlan
          onTap: null,
        ),
      ),
    );
  }
}

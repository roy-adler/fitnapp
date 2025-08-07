import 'package:fitnapp/App/Exercise/exercise_view.dart';
import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/Data/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseListView extends StatefulWidget {
  FitnessPlan fitnessPlan;

  ExerciseListView({@required this.fitnessPlan});

  @override
  _ExerciseListViewState createState() => _ExerciseListViewState();
}

class _ExerciseListViewState extends State<ExerciseListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        //previousPageTitle: "Exercises",
        middle: Text("ExerciseList"),
      ),
      body: ListView.builder(
        itemCount: Data.theExerciseList().length,
        itemBuilder: (context, index) => ListTile(
            title: Text(Data.theExerciseList()[index].title),
            trailing: CupertinoButton(
              child: Text('Detail'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ExerciseView(exercise: Data.theExerciseList()[index]),
                ),
              ),
            ),
            // TODO: Add Exercise to FitnessPlan
            onTap: () {
              Data.addExercise(
                  widget.fitnessPlan, Data.theExerciseList()[index]);
              Navigator.maybePop(context);
            }),
      ),
    );
  }
}

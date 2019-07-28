import 'dart:io';

import 'package:fitnapp/App/Exercise/exercise.dart';
import 'package:fitnapp/App/Exercise/exercise_view.dart';
import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/Data/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseListView extends StatelessWidget {
  List<Exercise> exerciseList;
  FitnessPlan fitnessPlan;

  ExerciseListView({@required this.fitnessPlan, @required this.exerciseList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        //previousPageTitle: "Exercises",
        middle: Text("ExerciseList"),
      ),
      body: FutureBuilder(
          future: Data().loadExercises(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(exerciseList[index].title),
                      trailing: CupertinoButton(
                        child: Text('Detail'),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ExerciseView(exercise: snapshot.data[index]),
                          ),
                        ),
                      ),
                      onTap: null,
                    ),
                  )
                : Container(); // TODO: Create Case
          }),
    );
  }
}

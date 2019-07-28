import 'package:fitnapp/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseView extends StatelessWidget {
  Exercise exercise;

  ExerciseView({this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(32),
            height: 150.0,
            color: Colors.green,
          ),
          Text("Sets: " + exercise.sets.toString()),
          Text("Reps" + exercise.reps.toString()),
        ],
      ),
    );
  }
}

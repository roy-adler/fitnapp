import 'dart:io';

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
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(),
              height: 150.0,
              child: Image.asset(exercise.imagePath),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Sets:  " + exercise.sets.toString()),
                  Text("Reps: " + exercise.reps.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

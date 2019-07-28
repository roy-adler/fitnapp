import 'dart:io';

import 'package:fitnapp/exercise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseListView extends StatelessWidget {
  List<Exercise> exerciseList;

  ExerciseListView({@required this.exerciseList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        //previousPageTitle: "Exercises",
        middle: Text("ExerciseList"),
      ),
      body: ListView.builder(
          itemCount: exerciseList.length,
          itemBuilder: (context, index) => exerciseList[index]),
    );
  }
}

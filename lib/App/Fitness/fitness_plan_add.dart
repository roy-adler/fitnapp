import 'package:fitnapp/App/Exercise/exercise_list_view.dart';
import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/Data/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FitnessPlanAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        previousPageTitle: "Overview",
        middle: Text("Add Fitnessplan"),
      ),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            Data.addFitnessPlan(FitnessPlan(
              title: "Hello",
            ));
          },
        ),
      ),
    );
  }
}

import 'package:fitnapp/exercise.dart';
import 'package:fitnapp/fitness_plan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statusbar/statusbar.dart';

class FitnessPlanView extends StatelessWidget {
  FitnessPlan fitnessPlan;

  FitnessPlanView(this.fitnessPlan);

  @override
  Widget build(BuildContext context) {
    StatusBar.color(Color.fromRGBO(255, 0, 0, 0.0));
    return Scaffold(
      appBar: CupertinoNavigationBar(
          previousPageTitle: "Overview",
          middle: Text(fitnessPlan.title),
          trailing: GestureDetector(
            onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => Scaffold(
                        appBar: CupertinoNavigationBar(
                          middle: Text('ExerciseList'),
                        ),
                        body: Center(child: Text("Nix"))))),
            child: Text(
              'Add',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          )),
      body: ListView.builder(
          itemCount: fitnessPlan.exerciseList.length,
          itemBuilder: (context, index) => fitnessPlan.exerciseList[index]),
    );
  }
}

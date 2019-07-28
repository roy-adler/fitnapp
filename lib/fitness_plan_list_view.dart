import 'package:fitnapp/exercise.dart';
import 'package:fitnapp/fitness_plan.dart';
import 'package:flutter/material.dart';
import 'package:statusbar/statusbar.dart';
import 'package:flutter/cupertino.dart';

class FitnessPlanListView extends StatelessWidget {
  List<FitnessPlan> fitnessPlanList;


  FitnessPlanListView({this.fitnessPlanList});

  @override
  Widget build(BuildContext context) {
    StatusBar.color(Color.fromRGBO(255, 0, 0, 0.0));
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Home"),
      ),
      body: ListView.builder(
          itemCount: fitnessPlanList.length,
          itemBuilder: (context, index) => fitnessPlanList[index]),
    );
  }
}

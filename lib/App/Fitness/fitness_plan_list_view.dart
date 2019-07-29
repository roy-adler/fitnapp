import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/App/Fitness/fitness_plan_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FitnessPlanListView extends StatelessWidget {
  List<FitnessPlan> fitnessPlanList;

  FitnessPlanListView({this.fitnessPlanList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Home"),
        trailing: GestureDetector(
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (pageContext) => FitnessPlanAdd(),
            ),
          ),
          child: Icon(
            CupertinoIcons.add,
            color: CupertinoColors.activeBlue,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: fitnessPlanList.length,
          itemBuilder: (context, index) => fitnessPlanList[index]),
    );
  }
}

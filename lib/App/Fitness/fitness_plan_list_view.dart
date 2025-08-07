import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/App/Fitness/fitness_plan_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FitnessPlanListView extends StatefulWidget {
  List<FitnessPlan> fitnessPlanList;
  Function() setStateFunction;

  FitnessPlanListView({this.fitnessPlanList, this.setStateFunction});

  @override
  _FitnessPlanListViewState createState() => _FitnessPlanListViewState();
}

class _FitnessPlanListViewState extends State<FitnessPlanListView> {
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
              builder: (pageContext) => FitnessPlanAdd(
                setStateFunction: widget.setStateFunction,
              ),
            ),
          ),
          child: Text(
            'Add',
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.fitnessPlanList.length,
          itemBuilder: (context, index) => widget.fitnessPlanList[index]),
    );
  }
}

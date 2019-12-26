import 'package:fitnapp/App/Exercise/exercise_list_view.dart';
import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/Data/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FitnessPlanView extends StatefulWidget {
  FitnessPlan fitnessPlan;

  FitnessPlanView(this.fitnessPlan);

  @override
  _FitnessPlanViewState createState() => _FitnessPlanViewState();
}

class _FitnessPlanViewState extends State<FitnessPlanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
          previousPageTitle: "Overview",
          middle: Text(widget.fitnessPlan.title),
          trailing: GestureDetector(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) =>
                    ExerciseListView(fitnessPlan: widget.fitnessPlan),
              ),
            ),
            child: Text(
              'Add',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          )),
      body: FutureBuilder(
        future: Data.getExerciseData(widget.fitnessPlan.title),
        builder: (context, snapshot) =>
            (snapshot.hasData && snapshot.data.length > 0)
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => snapshot.data[index])
                : Center(child: Text("No Exercises yet.")),
      ),
    );
  }
}

import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/Data/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FitnessPlanAdd extends StatelessWidget {
  Function() setStateFunction;

  FitnessPlanAdd({this.setStateFunction});

  @override
  Widget build(BuildContext context) {
    TextEditingController TEC = TextEditingController();
    return Scaffold(
      appBar: CupertinoNavigationBar(
        previousPageTitle: "Overview",
        middle: Text("Add Fitnessplan"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          height: 120,
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                child: CupertinoTextField(controller: TEC,),
              ),
              CupertinoButton(
                onPressed: () {
                  Data.addFitnessPlan(FitnessPlan(
                    title: TEC.text,
                  ));
                  Navigator.maybePop(context);
                  setStateFunction();
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

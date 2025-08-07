import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/Data/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FitnessPlanAdd extends StatelessWidget {
  Function() setStateFunction;

  FitnessPlanAdd({this.setStateFunction});

  bool _submit(TextEditingController TEC, BuildContext pageContext) {
    if (TEC.text.replaceAll(" ", "") == "") {
      return false;
    } else {
      Data.addFitnessPlan(FitnessPlan(
        title: TEC.text,
      ));
      Navigator.maybePop(pageContext);
      setStateFunction();
      return true;
    }
  }

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
                child: CupertinoTextField(
                  autofocus: true,
                  controller: TEC,
                  placeholder: "Fitnessplan Name",
                  onSubmitted: (String input) => _submit(TEC, context),
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  _submit(TEC, context);
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

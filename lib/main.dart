import 'package:fitnapp/fitness_plan_list_view.dart';
import 'package:flutter/material.dart';
import 'package:statusbar/statusbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    StatusBar.color(Color.fromRGBO(255, 0, 0, 0.0));
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(

        body: FitnessPlanListView(),
      ),
    );
  }
}

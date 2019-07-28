import 'package:fitnapp/exercise_view.dart';
import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
  String title;
  int sets;
  int reps;

  Exercise({@required this.title, this.sets = 3, this.reps = 12});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExerciseView(
            exercise: Exercise(title: title, sets: sets, reps: reps),
          ),
        ),
      ),
    );
  }
}

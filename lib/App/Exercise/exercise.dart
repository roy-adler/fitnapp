import 'package:fitnapp/App/Exercise/exercise_view.dart';
import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
  String title;
  String imagePath;
  int sets;
  int reps;
  int weight;

  Exercise({
    @required this.title,
    this.imagePath = "images/no_image.jpg",
    this.sets = 3,
    this.reps = 12,
    this.weight = 0,
  });

  Exercise.fromJson(Map<String, dynamic> m) {
    title = m['title'];
    imagePath = m['imagePath'];
    sets = m['sets'];
    reps = m['reps'];
    weight = m['weight'];
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'imagePath': imagePath,
        'sets': sets,
        'reps': reps,
        'weight': weight,
      };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExerciseView(
            exercise: Exercise(
              title: title,
              sets: sets,
              reps: reps,
              imagePath: imagePath,
              weight: weight,
            ),
          ),
        ),
      ),
    );
  }
}

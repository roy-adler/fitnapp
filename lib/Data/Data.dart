import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/App/Exercise/exercise.dart';

class Data {
  Future<List<FitnessPlan>> loadFitnessPlans() async {
    return [
      FitnessPlan(
        title: 'Fitnessplan 1',
        exerciseList: [
          Exercise(title: 'Exercise 1', reps: 4),
        ],
      ),
      FitnessPlan(
        title: 'Fitnessplan 2',
        exerciseList: [
          Exercise(title: 'Exercise 1'),
          Exercise(title: 'Exercise 2'),
          Exercise(title: 'Exercise 3'),
          Exercise(title: 'Exercise 4'),
          Exercise(title: 'Exercise 5', weight: 24),
        ],
      ),
    ];
  }

  Future<List<Exercise>> loadExercises() async {
    return [
      Exercise(title: 'Exercise 1'),
      Exercise(title: 'Exercise 2'),
      Exercise(title: 'Exercise 3'),
      Exercise(title: 'Exercise 4'),
      Exercise(title: 'Exercise 5', weight: 24),
    ];
  }
}

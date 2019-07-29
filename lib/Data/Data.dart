import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/App/Exercise/exercise.dart';

abstract class Data {
  static List<FitnessPlan> _fitnessPlanList = [];
  static List<Exercise> _exerciseList;

  static void init() {
    _fitnessPlanList = [];
    
    _exerciseList = [
      Exercise(title: 'Exercise 1'),
      Exercise(title: 'Exercise 2'),
      Exercise(title: 'Exercise 3'),
      Exercise(title: 'Exercise 4'),
      Exercise(title: 'Exercise 5', weight: 24),
    ];
  }

  static addFitnessplan(FitnessPlan FP) {
    _fitnessPlanList.add(FP);
  }

  static updateFitnessplan(FitnessPlan element) {
    print("UpdateFitnessplan");
    int index = _fitnessPlanList
        .indexWhere((FitnessPlan FP) => FP.title == element.title);
    _fitnessPlanList.removeAt(index);
    _fitnessPlanList.insert(index, element);
  }

  static Future<List<FitnessPlan>> loadFitnessPlans() async {
    return _fitnessPlanList;
  }

  static Future<List<Exercise>> loadExercises() async {
    return _exerciseList;
  }
}

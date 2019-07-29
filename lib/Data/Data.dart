import 'dart:convert';

import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/App/Exercise/exercise.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Data {
  static List<FitnessPlan> _fitnessPlanList = [];
  static List<Exercise> _exerciseList;

  static void init() {
    _fitnessPlanList = [];

    readExercises();
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

  static void saveReadExercises(List<Exercise> exercises) async {
    final String exerciseKey = 'exerciseKey';
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(exerciseKey, json.encode(exercises));

    exercises = [];
    json
        .decode(sp.getString(exerciseKey))
        .forEach((map) => exercises.add(new Exercise.fromJson(map)));
    _exerciseList = exercises;
  }

  static void readExercises() async {
    final String exerciseKey = 'exerciseKey';
    SharedPreferences sp = await SharedPreferences.getInstance();

    List<Exercise> exercises = [];
    json
        .decode(sp.getString(exerciseKey))
        .forEach((map) => exercises.add(new Exercise.fromJson(map)));
    _exerciseList = exercises;
  }
}

import 'dart:convert';

import 'package:fitnapp/App/Fitness/fitness_plan.dart';
import 'package:fitnapp/App/Exercise/exercise.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Data {
  static List<FitnessPlan> _fitnessPlanList;
  static String _fitnessPlanListKey = "FitnessPlanList";

  // Public
  // Init Data
  static void init() {
    _initFitnessPlanList();
  }

  // Public
  // adds Fitnessplan locally
  static addFitnessPlan(FitnessPlan fitnessPlan) {
    _fitnessPlanList.add(fitnessPlan);
    _updateFitnessPlanList();
  }

  static addExercise(FitnessPlan fitnessPlan, int index) {
    List<Exercise> exerciseList = fitnessPlan.exerciseList;
    Exercise exerciseToAdd = theExerciseList()[index];
    exerciseList.add(exerciseToAdd);
    _updateFitnessPlan(FitnessPlan(
      title: fitnessPlan.title,
      exerciseList: exerciseList,
    ));
  }

  // Fitnessplan can be updated if it exists
  static _updateFitnessPlan(FitnessPlan element) {
    int index = _fitnessPlanList
        .indexWhere((FitnessPlan FP) => FP.title == element.title);
    if (!index.isNegative) {
      _fitnessPlanList.removeAt(index);
      _fitnessPlanList.insert(index, element);
    }
    _updateFitnessPlanList();
  }

  // Public
  // Gets Future of FitnessPlan
  static Future<List<FitnessPlan>> fitnessPlanListFuture() async {
    return _fitnessPlanList;
  }

  // Public
  // Gets ExerciseList
  static List<Exercise> theExerciseList() {
    return [
      Exercise(title: 'Exercise 1'),
      Exercise(title: 'Exercise 2'),
      Exercise(title: 'Exercise 3'),
      Exercise(title: 'Exercise 4'),
    ];
  }

  // Init FitnessPlanList from Data
  static void _initFitnessPlanList() async {
    _fitnessPlanList = [];
    List<String> fitnessPlanNameList = await _getFitnessPlanNameList();
    for (int i = 0; i < fitnessPlanNameList.length; i++) {
      _fitnessPlanList.add(await _getFitnessPlanData(fitnessPlanNameList[i]));
    }
  }

  // TODO: Check this System
  static _updateFitnessPlanList() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    for (int index = 0; index < _fitnessPlanList.length; index++) {
      _addFitnessPlanData(_fitnessPlanList[index]);
    }
  }

  // Gets fitnessPlanNameList or returns empty
  static _getFitnessPlanNameList() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // TODO: ClearFuntion: sp.clear();
    if (sp.getStringList(_fitnessPlanListKey) == null) {
      sp.setStringList(_fitnessPlanListKey, <String>[]);
    }
    return sp.getStringList(_fitnessPlanListKey);
  }

  // FitnessPlan is being stored in Data
  static void _addFitnessPlanData(FitnessPlan fitnessPlan) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    List<String> fitnessPlanNameList = await _getFitnessPlanNameList();
    fitnessPlanNameList.add(fitnessPlan.title);
    sp.setStringList(_fitnessPlanListKey, fitnessPlanNameList);
    _addExerciseData(fitnessPlan.title, fitnessPlan.exerciseList);
  }

  // FitnessPlan is being converted from Name to FitnessPlan
  static Future<FitnessPlan> _getFitnessPlanData(
      String fitnessPlanTitle) async {
    return FitnessPlan(
        title: fitnessPlanTitle,
        exerciseList: await _getExerciseData(fitnessPlanTitle));
  }

  // Exercise is being stored in Data
  static void _addExerciseData(
      String fitnessPlanTitle, List<Exercise> exerciseList) async {
    final String exerciseKey = fitnessPlanTitle;
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(exerciseKey, json.encode(exerciseList));
  }

  // Returns ExerciseList from FitnessPlanName
  static Future<List<Exercise>> _getExerciseData(
      String fitnessPlanTitle) async {
    final String exerciseKey = await fitnessPlanTitle;
    SharedPreferences sp = await SharedPreferences.getInstance();
    String jsonExercise = await sp.getString(exerciseKey);

    // TODO: Check this Error
    if (jsonExercise == "null") {
      return await <Exercise>[];
    }

    List<Exercise> exerciseList = [];
    json
        .decode(sp.getString(exerciseKey))
        .forEach((map) => exerciseList.add(new Exercise.fromJson(map)));
    return exerciseList;
  }
}

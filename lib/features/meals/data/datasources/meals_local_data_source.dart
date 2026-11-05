import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:add_to_cart/gen/assets.gen.dart';
import '../models/meal_model.dart';

abstract class MealsLocalDataSource {
  Future<List<MealModel>> getMeals();
}

class MealsLocalDataSourceImpl implements MealsLocalDataSource {
  @override
  Future<List<MealModel>> getMeals() async {
    try {
      final jsonString = await rootBundle.loadString(Assets.data.meals);
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      final mealsList = jsonMap['meals'] as List<dynamic>;
      return mealsList
          .map((m) => MealModel.fromJson(m as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ('Failed to load or parse local meals data: $e');
    }
  }
}

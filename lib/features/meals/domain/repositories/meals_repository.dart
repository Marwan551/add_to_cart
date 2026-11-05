import 'package:add_to_cart/features/meals/domain/entities/meal.dart';

abstract class MealsRepository {
  Future<List<Meal>> getMeals();
}

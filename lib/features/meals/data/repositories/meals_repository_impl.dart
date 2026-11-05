import 'package:add_to_cart/features/meals/domain/entities/meal.dart';
import 'package:add_to_cart/features/meals/domain/repositories/meals_repository.dart';
import '../datasources/meals_local_data_source.dart';

class MealsRepositoryImpl implements MealsRepository {
  final MealsLocalDataSource localDataSource;

  MealsRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Meal>> getMeals() async {
    final mealModels = await localDataSource.getMeals();
    return mealModels;
  }
}

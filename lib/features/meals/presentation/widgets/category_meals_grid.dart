import 'package:flutter/material.dart';
import 'package:add_to_cart/core/style/app_style.dart';
import 'package:add_to_cart/features/meals/domain/entities/meal.dart';
import 'package:add_to_cart/features/meals/presentation/widgets/meal_card.dart';

class CategoryMealsGrid extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final List<Meal> meals;
  final Function(Meal meal) onAddToCartPressed;

  const CategoryMealsGrid({
    super.key,
    required this.isLoading,
    required this.errorMessage,
    required this.meals,
    required this.onAddToCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            errorMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, fontSize: 14),
          ),
        ),
      );
    }
    if (meals.isEmpty) {
      return const Center(
        child: Text(
          'No meals found',
          style: TextStyle(color: AppColors.muted, fontSize: 16),
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return MealCard(
          meal: meal,
          onAddToCartPressed: () => onAddToCartPressed(meal),
        );
      },
    );
  }
}

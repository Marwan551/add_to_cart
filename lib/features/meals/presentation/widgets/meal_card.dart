import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:add_to_cart/core/style/app_style.dart';
import 'package:add_to_cart/features/meals/domain/entities/meal.dart';
import 'package:add_to_cart/features/meals/presentation/providers/meals_provider.dart';
import 'package:add_to_cart/features/meals/presentation/widgets/meal_card_image.dart';
import 'package:add_to_cart/features/meals/presentation/widgets/meal_card_info.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  final VoidCallback onAddToCartPressed;

  const MealCard({
    super.key,
    required this.meal,
    required this.onAddToCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    final mealsProvider = context.watch<MealsProvider>();
    final isFavorite = mealsProvider.isFavorite(meal.id);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadii.card,
        border: Border.all(color: AppColors.line),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MealCardImage(
            imageUrl: meal.imageUrl,
            isFavorite: isFavorite,
            onFavoriteToggle: () => mealsProvider.toggleFavorite(meal.id),
          ),
          MealCardInfo(
            meal: meal,
            onAddToCartPressed: onAddToCartPressed,
          ),
        ],
      ),
    );
  }
}

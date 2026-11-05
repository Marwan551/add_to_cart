import 'package:flutter/material.dart';
import 'package:add_to_cart/core/style/app_style.dart';
import 'package:add_to_cart/core/widgets/pulsing_button.dart';
import 'package:add_to_cart/features/meals/domain/entities/meal.dart';
import 'package:add_to_cart/gen/assets.gen.dart';

class MealCardInfo extends StatelessWidget {
  final Meal meal;
  final VoidCallback onAddToCartPressed;

  const MealCardInfo({
    super.key,
    required this.meal,
    required this.onAddToCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.name,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  meal.description,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 11,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Divider(color: AppColors.line),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: meal.priceBeforeDiscount != null && meal.priceBeforeDiscount! > meal.price
                      ? Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 4,
                          children: [
                            Text(
                              formatMoney(meal.price),
                              style: const TextStyle(
                                color: AppColors.ink,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              formatMoney(meal.priceBeforeDiscount!),
                              style: const TextStyle(
                                color: AppColors.muted,
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        )
                      : const Text(
                          'Price upon selection',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
                PulsingButton(
                  onTap: onAddToCartPressed,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: AppRadii.field,
                    ),
                    child: Center(
                      child: Assets.images.addButton.svg(
                        width: 16,
                        height: 16,
                        colorFilter: const ColorFilter.mode(
                          AppColors.surface,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

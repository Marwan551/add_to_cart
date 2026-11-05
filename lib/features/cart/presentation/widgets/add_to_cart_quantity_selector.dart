// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:add_to_cart/core/style/app_style.dart';
import 'package:add_to_cart/core/widgets/pulsing_button.dart';
import 'package:add_to_cart/gen/assets.gen.dart';

class AddToCartQuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final double unitPrice;

  const AddToCartQuantitySelector({
    super.key,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
    required this.unitPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              PulsingButton(
                onTap: onDecrement,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Assets.images.removeButton.svg(width: 22, height: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  quantity.toString(),
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              PulsingButton(
                onTap: onIncrement,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Assets.images.addButton.svg(width: 22, height: 22),
                ),
              ),
            ],
          ),
        ),
        Text(
          formatMoney(unitPrice),
          style: const TextStyle(
            color: AppColors.ink,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

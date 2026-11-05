import 'package:flutter/material.dart';
import 'package:add_to_cart/core/style/app_style.dart';
import 'package:add_to_cart/gen/assets.gen.dart';

class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: AppRadii.field,
                border: Border.all(color: AppColors.line),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 14),
                  Image.asset(
                    'assets/images/search_icon.png',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Search for a meal',
                      style: TextStyle(color: AppColors.muted, fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: AppRadii.field,
              border: Border.all(color: AppColors.line),
            ),
            child: Center(
              child: Assets.images.filterIcon.svg(width: 20, height: 20),
            ),
          ),
        ],
      ),
    );
  }
}

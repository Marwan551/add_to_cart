import 'package:flutter/material.dart';
import 'package:add_to_cart/core/style/app_style.dart';

class MealCardImage extends StatelessWidget {
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const MealCardImage({
    super.key,
    required this.imageUrl,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          child: SizedBox(
            height: 120,
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const ColoredBox(
                color: AppColors.canvas,
                child: Center(
                  child: Icon(Icons.image_not_supported_outlined, color: AppColors.muted),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: onFavoriteToggle,
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 24,
                color:  AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

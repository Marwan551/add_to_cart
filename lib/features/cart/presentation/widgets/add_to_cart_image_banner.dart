import 'package:flutter/material.dart';
import 'package:add_to_cart/core/style/app_style.dart';

class AddToCartImageBanner extends StatelessWidget {
  final String imageUrl;

  const AddToCartImageBanner({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadii.card,
      child: SizedBox(
        height: 150,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:add_to_cart/core/style/app_style.dart';
import 'package:add_to_cart/core/widgets/pulsing_button.dart';
import 'package:add_to_cart/features/cart/domain/entities/cart_item.dart';
import 'package:add_to_cart/features/cart/presentation/providers/cart_provider.dart';
import 'package:add_to_cart/gen/assets.gen.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.read<CartProvider>();

    final selectedOptionsText = cartItem.selectedValues.isNotEmpty
        ? cartItem.selectedValues.map((v) => v.name).join(', ')
        : '';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadii.card,
        border: Border.all(color: AppColors.line),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: AppRadii.field,
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.network(
                    cartItem.meal.imageUrl,
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
                top: 4,
                left: 4,
                child: GestureDetector(
                  onTap: () => cartProvider.removeFromCart(cartItem.id),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/Delete.png',
                      width: 20,
                      height: 20,),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.meal.name,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                if (selectedOptionsText.isNotEmpty)
                  Text(
                    selectedOptionsText,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 12,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 8),
                Text(
                  formatMoney(cartItem.totalPrice),
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PulsingButton(
                onTap: () => cartProvider.updateQuantity(cartItem.id, cartItem.quantity + 1),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Assets.images.addButton.svg(
                      width: 28,
                      height: 28,
                      colorFilter: const ColorFilter.mode(AppColors.surface, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  cartItem.quantity.toString(),
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              PulsingButton(
                onTap: () => cartProvider.updateQuantity(cartItem.id, cartItem.quantity - 1),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Assets.images.removeButton.svg(
                      width: 28,
                      height: 28,
                      colorFilter: const ColorFilter.mode(AppColors.surface, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

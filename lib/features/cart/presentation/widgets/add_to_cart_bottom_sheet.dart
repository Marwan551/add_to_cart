import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:add_to_cart/core/style/app_style.dart';
import 'package:add_to_cart/features/cart/domain/services/cart_pricing_service.dart';
import 'package:add_to_cart/features/cart/presentation/providers/cart_provider.dart';
import 'package:add_to_cart/features/cart/presentation/widgets/add_to_cart_bottom_button.dart';
import 'package:add_to_cart/features/cart/presentation/widgets/add_to_cart_header.dart';
import 'package:add_to_cart/features/cart/presentation/widgets/add_to_cart_image_banner.dart';
import 'package:add_to_cart/features/cart/presentation/widgets/add_to_cart_options_list.dart';
import 'package:add_to_cart/features/cart/presentation/widgets/add_to_cart_quantity_selector.dart';
import 'package:add_to_cart/features/meals/domain/entities/meal.dart';
import 'package:add_to_cart/features/meals/presentation/providers/meals_provider.dart';

class AddToCartBottomSheet extends StatefulWidget {
  final Meal meal;

  const AddToCartBottomSheet({super.key, required this.meal});

  @override
  State<AddToCartBottomSheet> createState() => _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState extends State<AddToCartBottomSheet> {
  int _quantity = 1;
  final CartPricingService _pricingService = CartPricingService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealsProvider>().selectMeal(widget.meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealsProvider = context.watch<MealsProvider>();
    final cartProvider = context.watch<CartProvider>();
    final selectedValues = mealsProvider.getSelectedValuesForMeal();
    final totalPrice = _pricingService.calculateItemTotal(widget.meal, selectedValues, _quantity);
    final unitPrice = _pricingService.calculateUnitPrice(widget.meal, selectedValues);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.70,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AddToCartHeader(title: widget.meal.name),
          const SizedBox(height: 12),
          AddToCartImageBanner(imageUrl: widget.meal.imageUrl),
          const SizedBox(height: 16),
          AddToCartQuantitySelector(
            quantity: _quantity,
            unitPrice: unitPrice,
            onDecrement: () {
              if (_quantity > 1) {
                setState(() => _quantity--);
              }
            },
            onIncrement: () {
              setState(() => _quantity++);
            },
          ),
          const SizedBox(height: 16),
          AddToCartOptionsList(
            options: widget.meal.options,
            selectedOptions: mealsProvider.selectedOptions,
            onOptionSelected: (optionId, val, isMulti) {
              mealsProvider.selectOptionValue(optionId, val, isMultiSelect: isMulti);
            },
          ),
          const SizedBox(height: 16),
          AddToCartBottomButton(
            isLoading: cartProvider.isLoading,
            totalPrice: totalPrice,
            onPressed: () async {
              try {
                await cartProvider.addToCart(widget.meal, selectedValues, _quantity);
                if (!context.mounted) return;
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart successfully!')),
                );
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

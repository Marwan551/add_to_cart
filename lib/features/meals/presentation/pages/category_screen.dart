import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:add_to_cart/core/style/app_style.dart';
import 'package:add_to_cart/features/cart/presentation/pages/cart_screen.dart';
import 'package:add_to_cart/features/cart/presentation/providers/cart_provider.dart';
import 'package:add_to_cart/features/cart/presentation/widgets/add_to_cart_bottom_sheet.dart';
import 'package:add_to_cart/features/meals/presentation/providers/meals_provider.dart';
import 'package:add_to_cart/features/meals/presentation/widgets/category_header.dart';
import 'package:add_to_cart/features/meals/presentation/widgets/category_meals_grid.dart';
import 'package:add_to_cart/features/meals/presentation/widgets/search_filter_bar.dart';
import 'package:add_to_cart/gen/assets.gen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealsProvider>().fetchMeals();
    });
  }

  void _showAddToCartSheet(BuildContext context, meal) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddToCartBottomSheet(meal: meal),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealsProvider = context.watch<MealsProvider>();
    final cartProvider = context.watch<CartProvider>();
    final meals = mealsProvider.meals;

    return Scaffold(
      backgroundColor: AppColors.canvas,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            CategoryHeader(
              title: 'Sea Food',
              onBackPressed: () => Navigator.of(context).maybePop(),
              onMenuPressed: () {},
            ),
            const SearchFilterBar(),
            Expanded(
              child: CategoryMealsGrid(
                isLoading: mealsProvider.isLoading,
                errorMessage: mealsProvider.errorMessage,
                meals: meals,
                onAddToCartPressed: (meal) => _showAddToCartSheet(context, meal),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const CartScreen()),
          );
        },
        backgroundColor: AppColors.surface,
        shape: const CircleBorder(),
        elevation: 6,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Assets.images.cartIcon.svg(
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
            if (cartProvider.totalItemCount > 0)
              Positioned(
                top: -6,
                right: -6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    cartProvider.totalItemCount.toString(),
                    style: const TextStyle(
                      color: AppColors.surface,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

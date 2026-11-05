import 'package:add_to_cart/core/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:add_to_cart/core/di/injection.dart';
import 'package:add_to_cart/features/meals/presentation/providers/meals_provider.dart';
import 'package:add_to_cart/features/cart/presentation/providers/cart_provider.dart';
import 'package:add_to_cart/features/meals/presentation/pages/category_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MealsProvider>(create: (_) => getIt<MealsProvider>()),
        ChangeNotifierProvider<CartProvider>(create: (_) => getIt<CartProvider>()),
      ],
      child: MaterialApp(
        title: 'Add To Cart App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            primary: AppColors.primary,
          ),
          scaffoldBackgroundColor: AppColors.canvas,
          useMaterial3: true,
        ),
        home: const CategoryScreen(),
      ),
    );
  }
}

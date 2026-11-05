import 'meal_option.dart';

class Meal {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double? priceBeforeDiscount;
  final List<MealOption> options;

  const Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.priceBeforeDiscount,
    required this.options,
  });
}

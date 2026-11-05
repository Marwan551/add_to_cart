import 'package:add_to_cart/features/meals/domain/entities/meal.dart';
import 'meal_option_model.dart';

class MealModel extends Meal {
  const MealModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.price,
    super.priceBeforeDiscount,
    required List<MealOptionModel> super.options,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      price: (json['price'] as num).toDouble(),
      priceBeforeDiscount: json['price_before_discount'] != null
          ? (json['price_before_discount'] as num).toDouble()
          : null,
      options: (json['options'] as List<dynamic>)
          .map((o) => MealOptionModel.fromJson(o as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'price': price,
      'price_before_discount': priceBeforeDiscount,
      'options': options.map((o) => (o as MealOptionModel).toJson()).toList(),
    };
  }
}

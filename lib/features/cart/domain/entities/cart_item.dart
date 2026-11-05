import 'package:add_to_cart/features/meals/domain/entities/meal.dart';
import 'package:add_to_cart/features/meals/domain/entities/option_value.dart';
import 'package:add_to_cart/features/cart/domain/services/cart_pricing_service.dart';

class CartItem {
  final String id;
  final Meal meal;
  final int quantity;
  final List<OptionValue> selectedValues;

  const CartItem({
    required this.id,
    required this.meal,
    required this.quantity,
    required this.selectedValues,
  });

  double get unitPrice => CartPricingService().calculateUnitPrice(meal, selectedValues);

  double get totalPrice => unitPrice * quantity;
}

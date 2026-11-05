import 'package:add_to_cart/features/cart/domain/entities/cart_item.dart';
import 'package:add_to_cart/features/meals/domain/entities/meal.dart';
import 'package:add_to_cart/features/meals/domain/entities/option_value.dart';

class CartPricingService {
  void validateRequiredSelections(Meal meal, List<OptionValue> selectedValues) {
    final selectedValueIds = selectedValues.map((s) => s.id).toSet();

    for (final option in meal.options) {
      if (option.isRequired) {
        final hasSelectionForOption = option.values.any((val) => selectedValueIds.contains(val.id));
        if (!hasSelectionForOption) {
          throw ArgumentError('Required option "${option.name}" must be selected.');
        }
      }
    }
  }

  double calculateUnitPrice(Meal meal, List<OptionValue> selectedValues) {
    double basePrice = meal.price;

    for (final option in meal.options) {
      if (option.isPriceDetermining) {
        OptionValue? match;
        for (final val in option.values) {
          if (selectedValues.any((s) => s.id == val.id)) {
            match = val;
            break;
          }
        }
        if (match != null) {
          basePrice = match.price;
        } else if (option.values.isNotEmpty) {
          basePrice = option.values.first.price;
        }
        break;
      }
    }

    double extrasPrice = 0.0;
    for (final val in selectedValues) {
      bool isPriceDet = false;
      for (final option in meal.options) {
        if (option.isPriceDetermining && option.values.any((v) => v.id == val.id)) {
          isPriceDet = true;
          break;
        }
      }
      if (!isPriceDet) {
        extrasPrice += val.price;
      }
    }

    return basePrice + extrasPrice;
  }

  double getBasePrice(Meal meal, List<OptionValue> selectedValues) {
    for (final option in meal.options) {
      if (option.isPriceDetermining) {
        for (final val in option.values) {
          if (selectedValues.any((s) => s.id == val.id)) {
            return val.price;
          }
        }
        if (option.values.isNotEmpty) {
          return option.values.first.price;
        }
      }
    }
    return meal.price;
  }

  double calculateItemTotal(Meal meal, List<OptionValue> selectedValues, int quantity) {
    return calculateUnitPrice(meal, selectedValues) * quantity;
  }

  bool areOptionsIdentical(List<OptionValue> values1, List<OptionValue> values2) {
    if (values1.length != values2.length) return false;
    final ids1 = values1.map((v) => v.id).toSet();
    final ids2 = values2.map((v) => v.id).toSet();
    return ids1.length == ids2.length && ids1.containsAll(ids2);
  }

  bool isDuplicate(CartItem existingItem, Meal meal, List<OptionValue> selectedValues) {
    if (existingItem.meal.id != meal.id) return false;
    return areOptionsIdentical(existingItem.selectedValues, selectedValues);
  }
}

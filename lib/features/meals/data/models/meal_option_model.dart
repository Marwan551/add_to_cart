import 'package:add_to_cart/features/meals/domain/entities/meal_option.dart';
import 'option_value_model.dart';

class MealOptionModel extends MealOption {
  const MealOptionModel({
    required super.id,
    required super.name,
    required super.isRequired,
    required super.isSingle,
    required super.isPriceDetermining,
    required List<OptionValueModel> super.values,
  });

  factory MealOptionModel.fromJson(Map<String, dynamic> json) {
    return MealOptionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      isRequired: json['is_required'] as bool,
      isSingle: json['is_single'] as bool,
      isPriceDetermining: json['is_price_determining'] as bool,
      values: (json['values'] as List<dynamic>)
          .map((v) => OptionValueModel.fromJson(v as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'is_required': isRequired,
      'is_single': isSingle,
      'is_price_determining': isPriceDetermining,
      'values': values.map((v) => (v as OptionValueModel).toJson()).toList(),
    };
  }
}

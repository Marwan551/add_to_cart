import 'package:add_to_cart/features/meals/domain/entities/option_value.dart';

class OptionValueModel extends OptionValue {
  const OptionValueModel({
    required super.id,
    required super.name,
    required super.price,
  });

  factory OptionValueModel.fromJson(Map<String, dynamic> json) {
    return OptionValueModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}

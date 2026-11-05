import 'option_value.dart';

class MealOption {
  final String id;
  final String name;
  final bool isRequired;
  final bool isSingle;
  final bool isPriceDetermining;
  final List<OptionValue> values;

  const MealOption({
    required this.id,
    required this.name,
    required this.isRequired,
    required this.isSingle,
    required this.isPriceDetermining,
    required this.values,
  });
}

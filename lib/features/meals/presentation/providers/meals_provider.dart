import 'package:flutter/foundation.dart';
import 'package:add_to_cart/features/meals/domain/entities/meal.dart';
import 'package:add_to_cart/features/meals/domain/entities/option_value.dart';
import 'package:add_to_cart/features/meals/domain/repositories/meals_repository.dart';

class MealsProvider extends ChangeNotifier {
  final MealsRepository mealsRepository;

  MealsProvider({required this.mealsRepository});

  List<Meal> _meals = [];
  List<Meal> get meals => _meals;


  final Set<String> _favoriteMealIds = {};
  bool isFavorite(String mealId) => _favoriteMealIds.contains(mealId);

  void toggleFavorite(String mealId) {
    if (_favoriteMealIds.contains(mealId)) {
      _favoriteMealIds.remove(mealId);
    } else {
      _favoriteMealIds.add(mealId);
    }
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Meal? _selectedMeal;
  Meal? get selectedMeal => _selectedMeal;

  final Map<String, List<OptionValue>> _selectedOptions = {};
  Map<String, List<OptionValue>> get selectedOptions => _selectedOptions;

  Future<void> fetchMeals() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _meals = await mealsRepository.getMeals();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectMeal(Meal meal) {
    _selectedMeal = meal;
    _selectedOptions.clear();
    for (final option in meal.options) {
      if (option.isRequired && option.isSingle && option.values.isNotEmpty) {
        _selectedOptions[option.id] = [option.values.first];
      }
    }
    notifyListeners();
  }

  void selectOptionValue(String optionId, OptionValue value, {bool isMultiSelect = false}) {
    if (isMultiSelect) {
      _selectedOptions.update(
        optionId,
        (list) {
          final existingIndex = list.indexWhere((v) => v.id == value.id);
          if (existingIndex != -1) {
            list.removeAt(existingIndex);
          } else {
            list.add(value);
          }
          return list;
        },
        ifAbsent: () => [value],
      );
    } else {
      _selectedOptions[optionId] = [value];
    }
    notifyListeners();
  }

  List<OptionValue> getSelectedValuesForMeal() {
    return _selectedOptions.values.expand((x) => x).toList();
  }


}

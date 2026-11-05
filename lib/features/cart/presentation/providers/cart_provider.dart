import 'package:flutter/foundation.dart';
import 'package:add_to_cart/features/cart/domain/entities/cart_item.dart';
import 'package:add_to_cart/features/cart/domain/repositories/cart_repository.dart';
import 'package:add_to_cart/features/cart/domain/services/cart_pricing_service.dart';
import 'package:add_to_cart/features/meals/domain/entities/meal.dart';
import 'package:add_to_cart/features/meals/domain/entities/option_value.dart';

class CartProvider extends ChangeNotifier {
  final CartRepository cartRepository;
  final CartPricingService pricingService;

  CartProvider({
    required this.cartRepository,
    CartPricingService? pricingService,
  }) : pricingService = pricingService ?? CartPricingService() {
    _initCartStream();
  }

  List<CartItem> _items = [];
  List<CartItem> get items => _items;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void _initCartStream() {
    cartRepository.getCartItems().listen((cartItems) {
      _items = cartItems;
      notifyListeners();
    });
  }

  Future<void> addToCart(Meal meal, List<OptionValue> selectedValues, int quantity) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      pricingService.validateRequiredSelections(meal, selectedValues);
      final newItem = CartItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        meal: meal,
        quantity: quantity,
        selectedValues: selectedValues,
      );
      await cartRepository.addToCart(newItem);
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> removeFromCart(String itemId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await cartRepository.removeFromCart(itemId);
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateQuantity(String itemId, int quantity) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await cartRepository.updateQuantity(itemId, quantity);
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> clearCart() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await cartRepository.clearCart();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  double get subtotal => _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  int get totalItemCount => _items.fold(0, (sum, item) => sum + item.quantity);
}

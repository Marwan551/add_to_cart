import 'dart:async';
import 'package:add_to_cart/features/cart/domain/entities/cart_item.dart';
import 'package:add_to_cart/features/cart/domain/repositories/cart_repository.dart';
import 'package:add_to_cart/features/cart/domain/services/cart_pricing_service.dart';

class CartRepositoryImpl implements CartRepository {
  final List<CartItem> _items = [];
  final CartPricingService pricingService;
  final StreamController<List<CartItem>> _controller = StreamController<List<CartItem>>.broadcast();

  CartRepositoryImpl({CartPricingService? pricingService})
      : pricingService = pricingService ?? CartPricingService();

  void _emit() {
    _controller.add(List.unmodifiable(_items));
  }

  @override
  Stream<List<CartItem>> getCartItems() async* {
    yield List.unmodifiable(_items);
    yield* _controller.stream;
  }

  @override
  Future<void> addToCart(CartItem item) async {
    pricingService.validateRequiredSelections(item.meal, item.selectedValues);

    final existingIndex = _items.indexWhere(
      (existing) => pricingService.isDuplicate(existing, item.meal, item.selectedValues),
    );
    if (existingIndex != -1) {
      final existing = _items[existingIndex];
      _items[existingIndex] = CartItem(
        id: existing.id,
        meal: existing.meal,
        quantity: existing.quantity + item.quantity,
        selectedValues: existing.selectedValues,
      );
    } else {
      _items.add(item);
    }
    _emit();
  }

  @override
  Future<void> removeFromCart(String itemId) async {
    _items.removeWhere((item) => item.id == itemId);
    _emit();
  }

  @override
  Future<void> updateQuantity(String itemId, int quantity) async {
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        final item = _items[index];
        _items[index] = CartItem(
          id: item.id,
          meal: item.meal,
          quantity: quantity,
          selectedValues: item.selectedValues,
        );
      }
      _emit();
    }
  }

  @override
  Future<void> clearCart() async {
    _items.clear();
    _emit();
  }
}

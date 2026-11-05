import 'package:add_to_cart/features/cart/domain/entities/cart_item.dart';

abstract class CartRepository {
  Stream<List<CartItem>> getCartItems();
  Future<void> addToCart(CartItem item);
  Future<void> removeFromCart(String itemId);
  Future<void> updateQuantity(String itemId, int quantity);
  Future<void> clearCart();
}

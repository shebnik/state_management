import 'package:state_management/models/item.dart';

class CartState {
  final List<Item> cart;

  const CartState({
    this.cart = const [],
  });

  CartState copyWith({
    List<Item>? cart,
    Item? item,
  }) {
    return CartState(
      cart: cart ?? this.cart,
    );
  }
}

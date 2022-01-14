import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/models/item.dart';
import 'package:state_management/models/state/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  addToCart(Item item) async {
    final list = [...state.cart, item];
    emit(state.copyWith(cart: list));
  }

  removeFromCart(Item item) {
    final list = state.cart.where((element) => element.id != item.id).toList();
    emit(state.copyWith(cart: list));
  }
}

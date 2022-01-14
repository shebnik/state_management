import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/events/events.dart';
import 'package:state_management/models/state/cart_state.dart';

class CartBloc extends Bloc<Event, CartState> {
  CartBloc() : super(const CartState());

  @override
  Stream<CartState> mapEventToState(Event event) async* {
    if (event is AddToCartEvent) {
      final list = [...state.cart, event.item];
      yield state.copyWith(cart: list);
    } else if (event is RemoveFromCartEvent) {
      final list =
          state.cart.where((element) => element.id != event.item.id).toList();
      yield state.copyWith(cart: list);
    }
  }
}

import 'dart:async';

import 'package:state_management/events/events.dart';
import 'package:state_management/models/state/cart_state.dart';

class CartBloc {
  var _currentState = const CartState();

  final _stateController = StreamController<CartState>();
  final _eventsController = StreamController<Event>();

  Stream<CartState> get state => _stateController.stream;
  Sink<Event> get event => _eventsController.sink;

  CartBloc() {
    _eventsController.stream.listen(_handleEvent);
    _currentState = _currentState.copyWith(cart: []);
    _stateController.add(_currentState);
  }

  void dispose() {
    _stateController.close();
    _eventsController.close();
  }

  void _handleEvent(Event event) async {
    if (event is AddToCartEvent) {
      final list = [..._currentState.cart, event.item];
      _currentState = _currentState.copyWith(cart: list);
    } else if (event is RemoveFromCartEvent) {
      final list = _currentState.cart
          .where((element) => element.id != event.item.id)
          .toList();
      _currentState = _currentState.copyWith(cart: list);
    }
    _stateController.add(_currentState);
  }
}

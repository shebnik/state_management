import 'package:redux/redux.dart';
import 'package:state_management/actions/actions.dart';
import 'package:state_management/models/item.dart';

final cartReducer = combineReducers<List<Item>>([
  TypedReducer<List<Item>, AddToCartAction>(_addToCart),
  TypedReducer<List<Item>, RemoveFromCartAction>(_removeFromCart),
]);

List<Item> _addToCart(List<Item> items, AddToCartAction action) {
  return [...items, action.item];
}

List<Item> _removeFromCart(List<Item> items, RemoveFromCartAction action) {
  return items.where((element) => element.id != action.item.id).toList();
}

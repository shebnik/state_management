import 'package:redux/redux.dart';
import 'package:state_management/actions/actions.dart';
import 'package:state_management/models/item.dart';

final catalogReducer = combineReducers<List<Item>>([
  TypedReducer<List<Item>, CatalogLoadedAction>(_setLoadedCatalog),
  TypedReducer<List<Item>, CatalogNotLoadedAction>(_setNoCatalog),
]);

List<Item> _setLoadedCatalog(List<Item> items, CatalogLoadedAction action) {
  return action.items;
}

List<Item> _setNoCatalog(List<Item> speakers, CatalogNotLoadedAction action) {
  return [];
}

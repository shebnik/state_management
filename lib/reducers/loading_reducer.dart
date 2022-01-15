import 'package:redux/redux.dart';
import 'package:state_management/actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, CatalogLoadedAction>(_setLoaded),
  TypedReducer<bool, CatalogNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}

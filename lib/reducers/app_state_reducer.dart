import 'package:state_management/models/state/app_state.dart';
import 'package:state_management/reducers/cart_reducer.dart';
import 'package:state_management/reducers/catalog_reducer.dart';
import 'package:state_management/reducers/loading_reducer.dart';
import 'package:state_management/reducers/pages_reducer.dart';


AppState appReducer(AppState state, action) {
  return AppState(
    catalog: catalogReducer(state.catalog, action),
    cart: cartReducer(state.cart, action),
    activePage: pagesReducer(state.activePage, action),
    isLoading: loadingReducer(state.isLoading, action),
  );
}

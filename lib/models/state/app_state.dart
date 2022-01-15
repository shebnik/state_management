import 'package:state_management/models/app_page.dart';
import 'package:state_management/models/state/cart_state.dart';
import 'package:state_management/models/state/catalog_state.dart';

class AppState {
  final CatalogState catalogState;
  final CartState cartState;
  final AppPage activePage;

  const AppState({
    this.catalogState = const CatalogState(),
    this.cartState = const CartState(),
    this.activePage = AppPage.catalog,
  });

  AppState copyWith({
    CatalogState? catalogState,
    CartState? cartState,
    AppPage? activePage,
  }) {
    return AppState(
      catalogState: catalogState ?? this.catalogState,
      cartState: cartState ?? this.cartState,
      activePage: activePage ?? this.activePage,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management/actions/actions.dart';
import 'package:state_management/models/app_page.dart';
import 'package:state_management/models/item.dart';
import 'package:state_management/models/state/app_state.dart';
import 'package:state_management/ui/catalog_screen.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return CatalogScreen(
          catalog: vm.catalog,
          cart: vm.cart,
          addToCart: vm.addToCart,
          openCart: vm.openCart,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Item> catalog, cart;
  final bool loading;
  final Function(Item) addToCart;
  final VoidCallback openCart;

  _ViewModel({
    required this.loading,
    required this.catalog,
    required this.cart,
    required this.addToCart,
    required this.openCart,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      catalog: store.state.catalog,
      cart: store.state.cart,
      loading: store.state.isLoading,
      addToCart: (item) => store.dispatch(AddToCartAction(item)),
      openCart: () => store.dispatch(UpdatePageAction(AppPage.cart)),
    );
  }
}

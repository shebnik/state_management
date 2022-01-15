import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management/actions/actions.dart';
import 'package:state_management/models/app_page.dart';
import 'package:state_management/models/item.dart';
import 'package:state_management/models/state/app_state.dart';
import 'package:state_management/ui/cart_screen.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return CartScreen(
          cart: vm.cart,
          showCatalog: vm.showCatalog,
          removeFromCart: vm.removeFromCart,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Item> cart;
  final Function(Item) removeFromCart;
  final VoidCallback showCatalog;

  _ViewModel({
    required this.cart,
    required this.removeFromCart,
    required this.showCatalog,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      cart: store.state.cart,
      removeFromCart: (item) => store.dispatch(RemoveFromCartAction(item)),
      showCatalog: () => store.dispatch(UpdatePageAction(AppPage.catalog)),
    );
  }
}

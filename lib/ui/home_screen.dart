import 'package:flutter/material.dart';

import 'package:state_management/blocs/ui_bloc.dart';
import 'package:state_management/events/events.dart';
import 'package:state_management/models/app_page.dart';
import 'package:state_management/models/state/app_state.dart';
import 'package:state_management/ui/cart.dart';
import 'package:state_management/ui/catalog.dart';
import 'package:state_management/widgets/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  final Function blocBuilder;

  const HomeScreen({
    required this.blocBuilder,
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final UiBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = widget.blocBuilder();
    _bloc.event.add(LoadCatalogEvent());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppState>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoadingIndicator();
        }
        final catalogState = snapshot.data?.catalogState;
        if (catalogState == null) {
          return const LoadingIndicator();
        }
        final cartState = snapshot.data?.cartState;
        if (cartState == null) {
          return const LoadingIndicator();
        }

        if (snapshot.data?.activePage == AppPage.cart) {
          return MyCart(
            cartState: cartState,
            removeFromCart: (item) =>
                _bloc.event.add(RemoveFromCartEvent(item)),
            showCatalog: () =>
                _bloc.event.add(UpdatePageEvent(AppPage.catalog)),
          );
        }
        return MyCatalog(
          catalogState: catalogState,
          cartState: cartState,
          addToCart: (item) => _bloc.event.add(AddToCartEvent(item)),
          openCart: () => _bloc.event.add(UpdatePageEvent(AppPage.cart)),
        );
      },
    );
  }
}

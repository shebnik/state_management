import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management/actions/actions.dart';
import 'package:state_management/reducers/app_state_reducer.dart';
import 'package:state_management/ui/home_screen.dart';
import 'package:state_management/middleware/store_middleware.dart';
import 'package:state_management/models/state/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.loading(),
      middleware: createStoreMiddleware(),
    );

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'e-commerce',
        routes: {
          "/": (context) {
            return HomeScreen(
              onInit: () {
                StoreProvider.of<AppState>(context)
                    .dispatch(LoadCatalogAction());
              },
            );
          },
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

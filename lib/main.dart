import 'package:flutter/material.dart';
import 'package:state_management/blocs/cart_bloc.dart';
import 'package:state_management/blocs/catalog_bloc.dart';
import 'package:state_management/blocs/ui_bloc.dart';
import 'package:state_management/repository/catalog_repository.dart';
import 'package:state_management/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const catalogRepo = ConstCatalogRepository();

    final catalogBloc = CatalogBloc(catalogRepo);
    final cartBloc = CartBloc();

    return MaterialApp(
      title: 'e-commerce',
      home: HomeScreen(
        blocBuilder: () =>
            UiBloc(catalogBloc: catalogBloc, cartBloc: cartBloc),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/blocs/cart_bloc.dart';
import 'package:state_management/blocs/catalog_bloc.dart';
import 'package:state_management/events/events.dart';
import 'package:state_management/repository/catalog_repository.dart';
import 'package:state_management/ui/cart.dart';
import 'package:state_management/ui/catalog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const catalogRepo = ConstCatalogRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CatalogBloc>(
          create: (_) => CatalogBloc(catalogRepo)..add(LoadCatalogEvent()),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'e-commerce',
        initialRoute: '/',
        routes: {
          '/': (context) => const MyCatalog(),
          '/cart': (context) => const MyCart(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

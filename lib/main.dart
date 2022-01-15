import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/observables/commerce_observable.dart';
import 'package:state_management/repository/catalog_repository.dart';
import 'package:state_management/ui/cart.dart';
import 'package:state_management/ui/catalog_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (context) => CommerceState(const ConstCatalogRepository()),
          )
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

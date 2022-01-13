import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/ui/cart.dart';
import 'package:state_management/ui/catalog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
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

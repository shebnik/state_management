import 'package:flutter/material.dart';
import 'package:state_management/containers/active_page.dart';
import 'package:state_management/containers/my_cart.dart';
import 'package:state_management/containers/my_catalog.dart';
import 'package:state_management/models/app_page.dart';

class HomeScreen extends StatefulWidget {
  final void Function() onInit;

  const HomeScreen({
    required this.onInit,
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return ActivePage(
      builder: (context, activePage) =>
          activePage == AppPage.cart ? const MyCart() : const MyCatalog(),
    );
  }
}

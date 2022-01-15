import 'package:flutter/material.dart';

import 'package:state_management/models/item.dart';
import 'package:state_management/models/state/cart_state.dart';

class MyCart extends StatelessWidget {
  final CartState cartState;
  final void Function(Item) removeFromCart;
  final VoidCallback showCatalog;

  const MyCart({
    Key? key,
    required this.cartState,
    required this.removeFromCart,
    required this.showCatalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice =
        cartState.cart.fold(0, (total, current) => total + current.price);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: showCatalog,
        ),
        title: const Text('Корзина'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _CartList(
              cart: cartState.cart,
              removeFromCart: removeFromCart,
            ),
          ),
          const Divider(height: 4, color: Colors.black),
          SizedBox(
            height: 200,
            child: Center(
              child: Text(
                'Итого: $totalPrice грн',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final List<Item> cart;
  final void Function(Item) removeFromCart;

  const _CartList({
    Key? key,
    required this.cart,
    required this.removeFromCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context, index) {
        final cartItem = cart[index];
        return ListTile(
          leading: const Icon(
            Icons.done,
            color: Colors.green,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              removeFromCart(cartItem);
            },
          ),
          title: Text(
            '${cartItem.name} - ${cartItem.price} грн.',
          ),
        );
      },
    );
  }
}

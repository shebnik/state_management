import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/providers/state_provider.dart';

class MyCart extends ConsumerWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    double totalPrice = cart.fold(0, (total, current) => total + current.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _CartList(),
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

class _CartList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartController = ref.watch(cartProvider.notifier);

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
              cartController.remove(cartItem);
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

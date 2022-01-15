import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_management/observables/commerce_observable.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CommerceState>(context);

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
              child: Observer(builder: (context) {
                double totalPrice = state.cart
                    .fold(0, (total, current) => total + current.price);
                return Text(
                  'Итого: $totalPrice грн',
                  style: const TextStyle(fontSize: 50),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CommerceState>(context);
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: state.cart.length,
        itemBuilder: (context, index) {
          var item = state.cart[index];
          return ListTile(
            leading: const Icon(
              Icons.done,
              color: Colors.green,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                state.removeFromCart(item);
              },
            ),
            title: Text(
              '${item.name} - ${item.price} грн.',
            ),
          );
        },
      );
    });
  }
}

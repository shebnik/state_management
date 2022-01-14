import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/blocs/cart_bloc.dart';
import 'package:state_management/events/events.dart';
import 'package:state_management/models/state/cart_state.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        double totalPrice =
            state.cart.fold(0, (total, current) => total + current.price);

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
      },
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.cart.length,
          itemBuilder: (context, index) {
            final cartItem = state.cart[index];
            return ListTile(
              leading: const Icon(
                Icons.done,
                color: Colors.green,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  context.read<CartBloc>().add(RemoveFromCartEvent(cartItem));
                },
              ),
              title: Text(
                '${cartItem.name} - ${cartItem.price} грн.',
              ),
            );
          },
        );
      },
    );
  }
}

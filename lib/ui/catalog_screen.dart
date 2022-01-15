import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/item.dart';
import 'package:state_management/observables/commerce_observable.dart';
import 'package:state_management/widgets/loading_indicator.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CommerceState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: Observer(
        builder: (_) => !state.isLoaded
            ? const LoadingIndicator()
            : SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.catalog.length,
                  itemBuilder: (context, index) => _ListItem(index),
                ),
              ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CommerceState>(context);

    return Observer(builder: (_) {
      bool isInCart = state.cart.contains(item);
      return TextButton(
        onPressed: isInCart
            ? null
            : () {
                state.addToCart(item);
              },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Theme.of(context).primaryColor;
              }
              return null;
            },
          ),
        ),
        child: isInCart
            ? const Icon(Icons.check, semanticLabel: 'ADDED')
            : const Text('Добавить'),
      );
    });
  }
}

class _ListItem extends StatelessWidget {
  final int index;

  const _ListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CommerceState>(context);

    final item = state.catalog[index];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${item.name} - ${item.price} грн.',
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

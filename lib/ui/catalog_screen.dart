import 'package:flutter/material.dart';
import 'package:state_management/models/item.dart';

class CatalogScreen extends StatelessWidget {
  final List<Item> cart, catalog;
  final void Function(Item) addToCart;
  final VoidCallback openCart;

  const CatalogScreen({
    Key? key,
    required this.catalog,
    required this.cart,
    required this.addToCart,
    required this.openCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: openCart,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: catalog.length,
          itemBuilder: (context, index) => _ListItem(
            item: catalog[index],
            cart: cart,
            addToCart: addToCart,
          ),
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;
  final List<Item> cart;
  final void Function(Item) addToCart;

  const _AddButton({
    Key? key,
    required this.item,
    required this.cart,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isInCart = cart.contains(item);
    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              addToCart(item);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null;
        }),
      ),
      child: isInCart
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('Добавить'),
    );
  }
}

class _ListItem extends StatelessWidget {
  final Item item;
  final List<Item> cart;
  final void Function(Item) addToCart;

  const _ListItem({
    Key? key,
    required this.item,
    required this.cart,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            _AddButton(
              item: item,
              cart: cart,
              addToCart: addToCart,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/models/item.dart';
import 'package:state_management/providers/state_provider.dart';

class MyCatalog extends ConsumerWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalog = ref.watch(catalogProvider);
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
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: catalog.length,
          itemBuilder: (context, index) => _ListItem(index),
        ),
      ),
    );
  }
}

class _AddButton extends ConsumerWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartController = ref.watch(cartProvider.notifier);

    bool isInCart = cart.contains(item);

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              cartController.add(item);
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

class _ListItem extends ConsumerWidget {
  final int index;

  const _ListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalogController = ref.watch(catalogProvider.notifier);

    var item = catalogController.getById(index);

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

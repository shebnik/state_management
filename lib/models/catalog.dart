import 'package:flutter/material.dart';

class CatalogModel {
  static Map<String, double> items = {
    'Яблоко': 22,
    'Апельсин': 34,
    'Банан': 33,
    'Мандарин': 44,
    'Груша': 28,
    'Виноград': 32,
    'Огурец': 10,
    'Помидор': 12,
    'Лук': 15,
    'Перец': 20,
  };

  Item getById(int id) => Item(
        id,
        items.entries.elementAt(id).key,
        items.values.elementAt(id),
      );

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final double price;

  const Item(this.id, this.name, this.price);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}

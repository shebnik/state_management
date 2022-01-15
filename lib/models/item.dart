import 'package:flutter/material.dart';

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

  @override
  String toString() => 'Item(id: $id, name: $name, price: $price)';
}

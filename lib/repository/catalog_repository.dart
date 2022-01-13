import 'package:state_management/models/item.dart';

abstract class CatalogRepository {
  const CatalogRepository();

  List<Item> loadItems();
  
  Item getById(int id);
}

class ConstCatalogRepository extends CatalogRepository {
  const ConstCatalogRepository();

  static const _items = <Item>[
    Item(0, 'Яблоко', 22),
    Item(1, 'Апельсин', 34),
    Item(2, 'Банан', 33),
    Item(3, 'Мандарин', 44),
    Item(4, 'Груша', 28),
    Item(5, 'Виноград', 32),
    Item(6, 'Огурец', 10),
    Item(7, 'Помидор', 12),
    Item(8, 'Лук', 15),
    Item(9, 'Перец', 20),
  ];

  @override
  List<Item> loadItems() => _items;

  @override
  Item getById(int id) => _items.firstWhere((element) => element.id == id);
}

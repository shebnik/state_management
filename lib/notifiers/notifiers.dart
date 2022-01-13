import 'package:state_management/models/item.dart';
import 'package:state_management/repository/catalog_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class CatalogNotifier extends StateNotifier<List<Item>> {
  final CatalogRepository _catalogRepository;

  CatalogNotifier(this._catalogRepository) : super([]) {
    _init();
  }

  void _init() {
    state = _catalogRepository.loadItems();
  }

  Item getById(int id) => _catalogRepository.getById(id);
}

class CartNotifier extends StateNotifier<List<Item>> {
  CartNotifier() : super([]);

  double totalPrice = 0;

  void updateTotalPrice() =>
      totalPrice = state.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    state = [...state, item];
    updateTotalPrice();
  }

  void remove(Item item) {
    state = state.where((element) => element.id != item.id).toList();
    updateTotalPrice();
  }
}

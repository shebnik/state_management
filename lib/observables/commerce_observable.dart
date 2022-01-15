import 'package:mobx/mobx.dart';
import 'package:state_management/models/app_page.dart';
import 'package:state_management/models/item.dart';
import 'package:state_management/repository/catalog_repository.dart';

part 'commerce_observable.g.dart';

class CommerceState = _CommerceState with _$CommerceState;

abstract class _CommerceState with Store {
  final CatalogRepository _catalogRepository;

  @observable
  List<Item> catalog = [];

  @observable
  List<Item> cart = [];

  @observable
  AppPage activePage = AppPage.catalog;

  @computed
  bool get isLoaded => catalog.isNotEmpty;

  _CommerceState(this._catalogRepository) {
    _initCatalog();
  }

  @action
  Future<void> _initCatalog() async {
    catalog = await _catalogRepository.loadItems();
  }

  @action
  void addToCart(Item item) {
    cart = [...cart, item];
  }

  @action
  void removeFromCart(Item item) {
    cart = cart.where((element) => element.id != item.id).toList();
  }

  @action
  void updatePage(AppPage page) {
    activePage = page;
  }
}

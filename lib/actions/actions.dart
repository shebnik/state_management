import 'package:state_management/models/app_page.dart';
import 'package:state_management/models/item.dart';

class LoadCatalogAction {}

class CatalogNotLoadedAction {}

class CatalogLoadedAction {
  final List<Item> items;

  CatalogLoadedAction(this.items);
}

class AddToCartAction {
  final Item item;

  AddToCartAction(this.item);
}

class RemoveFromCartAction {
  final Item item;

  RemoveFromCartAction(this.item);
}

class UpdatePageAction {
  final AppPage newPage;

  UpdatePageAction(this.newPage);
}

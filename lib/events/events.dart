import 'package:state_management/models/app_page.dart';
import 'package:state_management/models/item.dart';

abstract class Event {}

abstract class CatalogEvent extends Event {}

abstract class CartEvent extends Event {}

class LoadCatalogEvent extends CatalogEvent {}

class AddToCartEvent extends CartEvent {
  final Item item;

  AddToCartEvent(this.item);
}

class RemoveFromCartEvent extends CartEvent {
  final Item item;

  RemoveFromCartEvent(this.item);
}

class UpdatePageEvent extends Event {
  final AppPage newPage;

  UpdatePageEvent(this.newPage);
}
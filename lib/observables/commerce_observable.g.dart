// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commerce_observable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CommerceState on _CommerceState, Store {
  Computed<bool>? _$isLoadedComputed;

  @override
  bool get isLoaded => (_$isLoadedComputed ??=
          Computed<bool>(() => super.isLoaded, name: '_CommerceState.isLoaded'))
      .value;

  final _$catalogAtom = Atom(name: '_CommerceState.catalog');

  @override
  List<Item> get catalog {
    _$catalogAtom.reportRead();
    return super.catalog;
  }

  @override
  set catalog(List<Item> value) {
    _$catalogAtom.reportWrite(value, super.catalog, () {
      super.catalog = value;
    });
  }

  final _$cartAtom = Atom(name: '_CommerceState.cart');

  @override
  List<Item> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(List<Item> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  final _$activePageAtom = Atom(name: '_CommerceState.activePage');

  @override
  AppPage get activePage {
    _$activePageAtom.reportRead();
    return super.activePage;
  }

  @override
  set activePage(AppPage value) {
    _$activePageAtom.reportWrite(value, super.activePage, () {
      super.activePage = value;
    });
  }

  final _$_initCatalogAsyncAction = AsyncAction('_CommerceState._initCatalog');

  @override
  Future<void> _initCatalog() {
    return _$_initCatalogAsyncAction.run(() => super._initCatalog());
  }

  final _$_CommerceStateActionController =
      ActionController(name: '_CommerceState');

  @override
  void addToCart(Item item) {
    final _$actionInfo = _$_CommerceStateActionController.startAction(
        name: '_CommerceState.addToCart');
    try {
      return super.addToCart(item);
    } finally {
      _$_CommerceStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromCart(Item item) {
    final _$actionInfo = _$_CommerceStateActionController.startAction(
        name: '_CommerceState.removeFromCart');
    try {
      return super.removeFromCart(item);
    } finally {
      _$_CommerceStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePage(AppPage page) {
    final _$actionInfo = _$_CommerceStateActionController.startAction(
        name: '_CommerceState.updatePage');
    try {
      return super.updatePage(page);
    } finally {
      _$_CommerceStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
catalog: ${catalog},
cart: ${cart},
activePage: ${activePage},
isLoaded: ${isLoaded}
    ''';
  }
}

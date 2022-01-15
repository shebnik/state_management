import 'package:state_management/models/app_page.dart';
import 'package:state_management/models/item.dart';

class AppState {
  final bool isLoading;
  final List<Item> catalog;
  final List<Item> cart;
  final AppPage activePage;

  const AppState({
    this.catalog = const [],
    this.cart = const [],
    this.isLoading = false,
    this.activePage = AppPage.catalog,
  });

  factory AppState.loading() => const AppState(isLoading: true);  

  AppState copyWith({
    bool? isLoading,
    List<Item>? catalog,
    List<Item>? cart,
    AppPage? activePage,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      catalog: catalog ?? this.catalog,
      cart: cart ?? this.cart,
      activePage: activePage ?? this.activePage,
    );
  }
}

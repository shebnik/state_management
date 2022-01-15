import 'package:state_management/models/item.dart';

class CatalogState {
  final List<Item> catalog;
  final bool isLoading;

  const CatalogState({
    this.catalog = const [],
    this.isLoading = true,
  });

  CatalogState copyWith({
    List<Item>? catalog,
    bool? isLoading,
    Item? item,
  }) {
    return CatalogState(
      catalog: catalog ?? this.catalog,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() => 'CatalogState(catalog: $catalog, isLoading: $isLoading)';
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_management/models/item.dart';
import 'package:state_management/notifiers/notifiers.dart';
import 'package:state_management/repository/catalog_repository.dart';

final catalogProvider = StateNotifierProvider<CatalogNotifier, List<Item>>(
  (_) => CatalogNotifier(
    const ConstCatalogRepository(),
  ),
);

final cartProvider = StateNotifierProvider<CartNotifier, List<Item>>(
  (_) => CartNotifier(),
);


final listedCatalogProvider = Provider((ref) => ref.watch(catalogProvider));
final listedCartProvider = Provider((ref) => ref.watch(cartProvider));
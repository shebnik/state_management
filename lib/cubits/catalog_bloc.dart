import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/models/state/catalog_state.dart';
import 'package:state_management/repository/catalog_repository.dart';

class CatalogCubit extends Cubit<CatalogState> {
  final CatalogRepository _catalogRepository;

  CatalogCubit(this._catalogRepository) : super(const CatalogState());

  Future<void> loadItems() async {
    try {
      final list = await _catalogRepository.loadItems();
      emit(state.copyWith(catalog: list, isLoading: false));
    } on Exception {
      emit(state.copyWith(catalog: [], isLoading: false));
    }
  }
}

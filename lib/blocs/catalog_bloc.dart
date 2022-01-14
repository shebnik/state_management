import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/events/events.dart';
import 'package:state_management/models/state/catalog_state.dart';
import 'package:state_management/repository/catalog_repository.dart';

class CatalogBloc extends Bloc<Event, CatalogState> {
  final CatalogRepository _catalogRepository;

  CatalogBloc(this._catalogRepository) : super(const CatalogState());

  @override
  Stream<CatalogState> mapEventToState(Event event) async* {
    if (event is LoadCatalogEvent) {
      try {
        final list = await _catalogRepository.loadItems();
        yield state.copyWith(catalog: list, isLoading: false);
      } on Exception {
        yield state.copyWith(catalog: [], isLoading: false);
      }
    }
  }
}

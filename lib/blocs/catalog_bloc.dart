import 'dart:async';

import 'package:state_management/events/events.dart';
import 'package:state_management/models/state/catalog_state.dart';
import 'package:state_management/repository/catalog_repository.dart';

class CatalogBloc {
  final CatalogRepository _catalogRepository;

  var _currentState = const CatalogState();

  final _stateController = StreamController<CatalogState>();
  final _eventsController = StreamController<Event>();

  Stream<CatalogState> get state => _stateController.stream;
  Sink<Event> get event => _eventsController.sink;

  CatalogBloc(this._catalogRepository) {
    _eventsController.stream.listen(_handleEvent);
  }
  
  void dispose() {
    _stateController.close();
    _eventsController.close();
  }

  void _handleEvent(Event event) async {
    if (event is LoadCatalogEvent) {
      try {
        final list = await _catalogRepository.loadItems();
        _currentState = _currentState.copyWith(catalog: list, isLoading: false);
      } on Exception {
        _currentState = _currentState.copyWith(catalog: [], isLoading: false);
      }
    }
    _stateController.add(_currentState);
  }
}

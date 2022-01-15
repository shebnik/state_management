import 'dart:async';

import 'package:state_management/blocs/cart_bloc.dart';
import 'package:state_management/blocs/catalog_bloc.dart';
import 'package:state_management/events/events.dart';
import 'package:state_management/models/state/app_state.dart';

class UiBloc {
  final CatalogBloc catalogBloc;
  final CartBloc cartBloc;

  var _currentState = const AppState();

  final _stateController = StreamController<AppState>();
  final _eventsController = StreamController<Event>();

  Stream<AppState> get state => _stateController.stream;
  Sink<Event> get event => _eventsController.sink;

  UiBloc({
    required this.catalogBloc,
    required this.cartBloc,
  }) {
    catalogBloc.state.listen((state) {
      _currentState = _currentState.copyWith(catalogState: state);

      _stateController.add(_currentState);
    });
    cartBloc.state.listen((state) {
      _currentState = _currentState.copyWith(cartState: state);
      _stateController.add(_currentState);
    });
    _eventsController.stream.listen((event) {
      if (event is UpdatePageEvent) {
        _currentState = _currentState.copyWith(activePage: event.newPage);
        _stateController.add(_currentState);
      } else if (event is CatalogEvent) {
        catalogBloc.event.add(event);
      } else if (event is CartEvent) {
        cartBloc.event.add(event);
      }
    });
  }

  void dispose() {
    catalogBloc.dispose();
    cartBloc.dispose();
    _stateController.close();
    _eventsController.close();
  }
}

import 'package:redux/redux.dart';
import 'package:state_management/actions/actions.dart';
import 'package:state_management/models/state/app_state.dart';
import 'package:state_management/repository/catalog_repository.dart';

List<Middleware<AppState>> createStoreMiddleware([
  CatalogRepository catalogRepo = const ConstCatalogRepository(),
]) {
  final loadSpeakers = _createLoadCatalog(catalogRepo);
  // final addToCart = _createAddToCart(talksRepo);
  // final removeFromCart = _createRemoveFromCart(talksRepo);

  return [
    TypedMiddleware<AppState, LoadCatalogAction>(loadSpeakers),
    // TypedMiddleware<AppState, UpdateSpeakerAction>(saveSpeakers),
    // TypedMiddleware<AppState, LoadTalksAction>(loadTalks),
    // TypedMiddleware<AppState, UpdateSpeakerAction>(saveTalks),
  ];
}

Middleware<AppState> _createLoadCatalog(CatalogRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository
        .loadItems()
        .then((items) => store.dispatch(
              CatalogLoadedAction(
                items,
              ),
            ))
        .catchError((_) => store.dispatch(CatalogNotLoadedAction()));

    next(action);
  };
}

// Middleware<AppState> _createAddToCart(TalksRepository repository) {
//   return (Store<AppState> store, action, NextDispatcher next) {
//     next(action);

//     repository.saveTalks(
//       store.state.talks,
//     );
//   };
// }

// Middleware<AppState> _createRemoveFromCart(TalksRepository repository) {
//   return (Store<AppState> store, action, NextDispatcher next) {
//     repository
//         .loadTalks()
//         .then((talks) => store.dispatch(
//               TalksLoadedAction(
//                 talks,
//               ),
//             ))
//         .catchError((_) => store.dispatch(TalksNotLoadedAction()));

//     next(action);
//   };
// }

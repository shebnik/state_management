import 'package:redux/redux.dart';
import 'package:state_management/actions/actions.dart';
import 'package:state_management/models/app_page.dart';

final pagesReducer = combineReducers<AppPage>([
  TypedReducer<AppPage, UpdatePageAction>(_activePageReducer),
]);

AppPage _activePageReducer(AppPage activeTab, UpdatePageAction action) {
  return action.newPage;
}

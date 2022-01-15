import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management/models/app_page.dart';
import 'package:state_management/models/state/app_state.dart';

class ActivePage extends StatelessWidget {
  final ViewModelBuilder<AppPage> builder;

  const ActivePage({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppPage>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.activePage,
      builder: builder,
    );
  }
}

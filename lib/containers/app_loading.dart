import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management/models/state/app_state.dart';

class AppLoading extends StatelessWidget {
  final Widget Function(BuildContext context, bool isLoading) builder;

  const AppLoading({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, bool>(
        distinct: true,
        converter: (Store<AppState> store) => store.state.isLoading,
        builder: builder,
      );
}

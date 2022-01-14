import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ots/ots.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';

import '../../base_bloc.dart';

typedef ListenDelegate<S> = void Function(BuildContext context, S state);
typedef StateListener<S> = Widget Function(S state);

abstract class BaseState<S, B extends BaseBloc<dynamic, S>,
    W extends StatefulWidget> extends VisibilityAwareState<W> {
  B blocOf(BuildContext context) => BlocProvider.of<B>(context);

  B? _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: (BuildContext context) {
        final bloc = getIt.get<B>();
        onBlocCreated(context, bloc);
        _bloc = bloc;
        return bloc;
      },
      child: Builder(
        builder: (BuildContext context) {
          initParams(context);

          return buildWidget(context);
        },
      ),
      lazy: false,
    );
  }

  Widget stateObserver(
    BuildContext context,
    StateListener<S> stateListener, {
    ListenDelegate<S>? listenDelegate,
  }) {
    return BlocConsumer(
      bloc: blocOf(context),
      builder: (BuildContext context, S state) => stateListener(state),
      listener: listenDelegate ?? _defaultListenDelegate,
    );
  }

  void _defaultListenDelegate(BuildContext context, S state) {}

  void onStateChanged(BuildContext context, S state) {}

  void onBlocCreated(BuildContext context, B bloc) {
    bloc.progressStream.listen((event) async {
      if (event) {
        await showLoader(
          isModal: true,
          modalDismissible: false,
          modalColor: Colors.black.withOpacity(0.5),
        );
      } else {
        await hideLoader();
      }
    });
  }

  void initParams(BuildContext context) {}

  Widget buildWidget(BuildContext context);

  @override
  void dispose() {
    if (_bloc != null) {
      _bloc?.dispose();
    }
    super.dispose();
  }
}

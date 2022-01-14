import 'dart:async';

import 'package:auto_route_demo_flow/arch/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fav_event.dart';
import 'fav_screen_state.dart';

class FavouriteBloc extends BaseBloc<FavouriteEvent, FavouriteScreenState> {
  FavouriteBloc() : super(FavouriteScreenState()) {
    on<InitEvent>(_onInit);
  }

  FutureOr<void> _onInit(
    InitEvent event,
    Emitter<FavouriteScreenState> emit,
  ) async {
    try {} catch (e) {}
  }
}

import 'dart:async';

import 'package:auto_route_demo_flow/arch/base_bloc.dart';
import 'package:auto_route_demo_flow/arch/logger.dart';
import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_screen_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeScreenState> {
  HomeBloc() : super(HomeScreenState()) {
    on<InitEvent>(_onInit);
    on<AddItemEvent>(_onAddItem);
    on<RemoveItemEvent>(_onRemoveItem);
    on<AddFavouriteEvent>(_onAddFav);
    on<RemoveFavouriteEvent>(_onRemoveFav);
    add(InitEvent());
  }

  FutureOr<void> _onInit(
    InitEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    final productList = productSource().findAllProduct();
    final favProductList = productSource().findAllFavouriteProduct();

    emit(state.copyWith(
      favProductList: favProductList,
      productList: productList,
    ));
  }

  FutureOr<void> _onAddItem(
    AddItemEvent event,
    Emitter<HomeScreenState> emit,
  ) {
    productSource().insertProduct(event.entity);
    emit(state.copyWith(
      productList: productSource().findAllProduct(),
    ));
  }

  FutureOr<void> _onRemoveItem(
    RemoveItemEvent event,
    Emitter<HomeScreenState> emit,
  ) {
    productSource().deleteProduct(event.entity);
    emit(state.copyWith(
      productList: productSource().findAllProduct(),
    ));
  }

  FutureOr<void> _onAddFav(
    AddFavouriteEvent event,
    Emitter<HomeScreenState> emit,
  ) {
    Logger.log('event.entity: ${event.entity}');
    productSource().insertFavProduct(event.entity);
    emit(state.copyWith(
      productList: productSource().findAllProduct(),
    ));
  }

  FutureOr<void> _onRemoveFav(
    RemoveFavouriteEvent event,
    Emitter<HomeScreenState> emit,
  ) {
    productSource().deleteFavProduct(event.entity);
    emit(state.copyWith(
      productList: productSource().findAllProduct(),
    ));
  }
}

import 'package:auto_route_demo_flow/domain/entities/product_entity.dart';

abstract class HomeEvent {}

class InitEvent extends HomeEvent {}

class AddItemEvent extends HomeEvent {
  final ProductEntity entity;

  AddItemEvent(this.entity);
}

class RemoveItemEvent extends HomeEvent {
  final ProductEntity entity;

  RemoveItemEvent(this.entity);
}

class AddFavouriteEvent extends HomeEvent {
  final ProductEntity entity;

  AddFavouriteEvent(this.entity);
}

class RemoveFavouriteEvent extends HomeEvent {
  final ProductEntity entity;

  RemoveFavouriteEvent(this.entity);
}

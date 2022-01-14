import 'package:auto_route_demo_flow/domain/entities/product_entity.dart';

class HomeScreenState {
  HomeScreenState({
    this.productList = const [],
    this.favProductList = const [],
  });

  List<ProductEntity> productList;
  List<ProductEntity> favProductList;

  HomeScreenState copyWith({
    List<ProductEntity>? productList,
    List<ProductEntity>? favProductList,
  }) {
    return HomeScreenState(
      productList: productList ?? this.productList,
      favProductList: favProductList ?? this.favProductList,
    );
  }
}

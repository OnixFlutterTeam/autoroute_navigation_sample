import 'package:auto_route_demo_flow/domain/entities/product_entity.dart';
import 'package:auto_route_demo_flow/domain/repository/favourite/product_favourite_repository.dart';

class ProductFavouriteRepositoryImpl extends ProductFavouriteRepository {
  final List<ProductEntity> _favProductList = [];

  @override
  void deleteProduct(ProductEntity product) {
    _favProductList.remove(product);
  }

  @override
  List<ProductEntity> findAllFavouriteProduct() {
    return _favProductList;
  }

  @override
  void insertProduct(ProductEntity product) {
    _favProductList.add(product);
  }

  @override
  ProductEntity findFavProductById(int id) {
    return _favProductList.firstWhere((product) => product.id == id);
  }
}

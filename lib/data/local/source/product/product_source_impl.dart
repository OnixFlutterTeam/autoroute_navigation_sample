import 'package:auto_route_demo_flow/domain/entities/product_entity.dart';
import 'package:auto_route_demo_flow/domain/repository/favourite/product_favourite_repository.dart';
import 'package:auto_route_demo_flow/domain/repository/product/product_repository.dart';

import 'product_source.dart';

class ProductSourceImpl extends ProductSource {
  ProductSourceImpl(this._productRepository, this._productFavRepository);

  final ProductRepository _productRepository;
  final ProductFavouriteRepository _productFavRepository;

  @override
  void deleteFavProduct(ProductEntity product) =>
      _productFavRepository.deleteProduct(product);

  @override
  List<ProductEntity> findAllFavouriteProduct() =>
      _productFavRepository.findAllFavouriteProduct();

  @override
  void insertFavProduct(ProductEntity product) =>
      _productFavRepository.insertProduct(product);

  @override
  ProductEntity findFavProductById(int id) =>
      _productFavRepository.findFavProductById(id);

  @override
  List<ProductEntity> findAllProduct() => _productRepository.findAllProduct();

  @override
  ProductEntity findProductById(int id) =>
      _productRepository.findProductById(id);

  @override
  void insertProductList(List<ProductEntity> list) =>
      _productRepository.insertProductList(list);

  @override
  void deleteProduct(ProductEntity product) {
    _productRepository.deleteProduct(product);
    deleteFavProduct(product);
  }

  @override
  void insertProduct(ProductEntity product) =>
      _productRepository.insertProduct(product);
}

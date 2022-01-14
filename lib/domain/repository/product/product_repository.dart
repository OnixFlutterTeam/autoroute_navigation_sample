import 'package:auto_route_demo_flow/domain/entities/product_entity.dart';

abstract class ProductRepository {
  List<ProductEntity> findAllProduct();

  ProductEntity findProductById(int id);

  void insertProduct(ProductEntity product);

  void insertProductList(List<ProductEntity> list);

  void deleteProduct(ProductEntity product);
}

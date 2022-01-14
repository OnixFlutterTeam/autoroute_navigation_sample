import 'dart:math';

import 'package:auto_route_demo_flow/dependency/service_locator.dart';
import 'package:auto_route_demo_flow/domain/entities/product_entity.dart';

class MockService {
  Random random = Random();

  final descriptionList = [
    'Saturated',
    'Protein',
    'Cholesterol',
    'Sodium',
    'Calcium',
    'Magnesium',
    'Potassium',
    'Iron',
    'Zinc',
    'Phosphorus',
    'Fat',
    'Energy',
  ];

  void create() {
    final list = generateData();
    productSource().insertProductList(list);
  }

  List<ProductEntity> generateData() {
    final list = <ProductEntity>[];

    for (int i = 0; i < descriptionList.length; i++) {
      final product = ProductEntity(
        id: i,
        price: random.nextInt(1000),
        description: descriptionList[i],
      );
      list.add(product);
    }
    return list;
  }
}

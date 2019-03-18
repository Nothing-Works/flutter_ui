import 'package:flutter_ui/src/apps/state/models/product.dart';

class ProductMock extends Product {
  static List<Product> fetchAll() {
    return [
      Product(name: 'Eggs'),
      Product(name: 'Flour'),
      Product(name: 'Chocolate chips'),
      Product(name: 'Rice'),
      Product(name: 'Milk'),
      Product(name: 'Honey'),
    ];
  }
}

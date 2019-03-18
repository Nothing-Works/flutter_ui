import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/state/mocks/product_mock.dart';
import 'package:flutter_ui/src/apps/state/models/product.dart';
import 'package:flutter_ui/src/apps/state/stateful_widget/shopping_list.dart';

class Shopping extends StatelessWidget {
  final List<Product> products = ProductMock.fetchAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ShoppingList(products),
    );
  }
}

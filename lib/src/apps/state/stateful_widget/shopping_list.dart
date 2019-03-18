import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/state/models/product.dart';
import 'package:flutter_ui/src/apps/state/stateless_widget/list_item.dart';

class ShoppingList extends StatefulWidget {
  final List<Product> products;
  ShoppingList(this.products);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _set = Set<Product>();

  void _onChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _set.remove(product);
      } else {
        _set.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: widget.products.map((product) {
      return ListItem(
        product: product,
        inCart: _set.contains(product),
        onChanged: _onChanged,
      );
    }).toList());
  }
}

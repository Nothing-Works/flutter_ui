import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/state/models/product.dart';
import 'package:flutter_ui/src/apps/state/types/function_types.dart';

class ListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartOnChangedCallback onChanged;

  ListItem({this.product, this.inCart, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => onChanged(product, inCart),
        leading: CircleAvatar(
          backgroundColor: _getColor(context),
          child: Text(product.name[0]),
        ),
        title: Text(product.name, style: _style(context)));
  }

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _style(BuildContext context) {
    if (!inCart) return null;
    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }
}

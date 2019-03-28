import 'package:flutter/material.dart';

import '../model/item.dart';
import '../repository/item_repository.dart';

class BlocListHome extends StatelessWidget {
  final repo = ItemRepository();
  @override
  Widget build(BuildContext context) {
    repo.fetchAll().then((List<Item> onValue) {
      onValue.forEach((Item item) {
        print(item.title);
      });
    });
    return Scaffold(appBar: AppBar(title: Text('Bloc List')));
  }
}

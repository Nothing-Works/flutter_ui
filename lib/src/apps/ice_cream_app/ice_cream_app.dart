import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/ice_cream_app/mocks/ice_cream_mock.dart';
import 'package:flutter_ui/src/apps/ice_cream_app/models/ice_cream.dart';

import './screens/home.dart';

class IceCreamApp extends StatelessWidget {
  final List<IceCream> list = IceCreamMock.fetchAll();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(list: list));
  }
}

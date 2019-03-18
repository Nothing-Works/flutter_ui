import 'package:flutter_ui/src/apps/ice_cream_app/models/ice_cream.dart';

class IceCreamMock extends IceCream {
  static List<IceCream> fetchAll() {
    return [
      IceCream(name: 'Strawberry', image: 'assets/images/ice_cream_1.png'),
      IceCream(name: 'Chocolate', image: 'assets/images/ice_cream_2.png'),
      IceCream(name: 'Vanilla', image: 'assets/images/ice_cream_3.png'),
    ];
  }
}

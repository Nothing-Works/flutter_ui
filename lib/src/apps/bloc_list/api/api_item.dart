import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/item.dart';

class ItemApi {
  Future<List<Item>> fetchItems() async {
    final response =
        await http.get('http://www.mocky.io/v2/5c9c1d293600009f4ad96f0f');

    if (response.statusCode == 200) {
      List collection = jsonDecode(response.body);
      return collection.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('can not load');
    }
  }
}

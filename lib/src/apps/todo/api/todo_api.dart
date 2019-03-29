import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/todo.dart';

class TodoApi {
  Future<List<Todo>> fetchAll() async {
    var response =
        await http.get('http://www.mocky.io/v2/5c9c1d293600009f4ad96f0f');
    if (response.statusCode == 200) {
      List collection = jsonDecode(response.body);
      return collection.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('can not load todos');
    }
  }
}

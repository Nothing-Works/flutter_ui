import 'dart:convert';

import 'package:flutter_ui/src/apps/bloc_vanilla/models/post.dart';
import 'package:http/http.dart' as http;

class PostApiProvider {
  Future<List<Post>> fetchAll() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      List collection = jsonDecode(response.body);
      return collection.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('fial to load posts');
    }
  }
}

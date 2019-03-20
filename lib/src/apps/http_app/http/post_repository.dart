import 'dart:convert';

import 'package:flutter_ui/src/apps/http_app/models/post.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  static Future<List<Post>> fetchAll() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      List collection = jsonDecode(response.body);
      return collection.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/post.dart';

class ApiPost {
  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      List collection = jsonDecode(response.body);
      return collection.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Can not fetch posts');
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/http_app/models/post.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Post> posts = <Post>[];

  Future loadPosts() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/posts');

    List content = jsonDecode(response.body);

    var list = content.map((post) => Post.fromJson(post)).toList();

    setState(() {
      posts = list;
    });
  }

  @override
  void initState() {
    loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            var post = posts[index];
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
            );
          }),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/src/apps/json/models/post.dart';

class JsonHome extends StatefulWidget {
  @override
  _JsonHomeState createState() => _JsonHomeState();
}

class _JsonHomeState extends State<JsonHome> {
  List<Post> posts = <Post>[];

  Future loadPosts() async {
    List list = jsonDecode(await rootBundle.loadString('data/data.json'));

    List<Post> things = list.map((a) {
      return Post.fromJson(a);
    }).toList();

    setState(() {
      posts = things;
    });
  }

  @override
  void initState() {
    loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Apps'),
      ),
      body: ListView.builder(
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

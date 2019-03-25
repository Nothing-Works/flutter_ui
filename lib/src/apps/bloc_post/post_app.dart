import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/bloc_post/ui/post.dart';

class PostApp extends StatefulWidget {
  @override
  _PostAppState createState() => _PostAppState();
}

class _PostAppState extends State<PostApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Post(),
    );
  }
}

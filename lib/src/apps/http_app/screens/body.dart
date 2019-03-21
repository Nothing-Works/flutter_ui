import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/http_app/http/post_repository.dart';
import 'package:flutter_ui/src/apps/http_app/models/post.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = PostRepository.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _futureBuilder(),
    );
  }

  Widget _futureBuilder() {
    return FutureBuilder<List<Post>>(
      future: _posts,
      builder: _futureBuilderItem,
    );
  }

  Widget _futureBuilderItem(
      BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            var post = snapshot.data[index];
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
            );
          });
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return CircularProgressIndicator();
  }
}

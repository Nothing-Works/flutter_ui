import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/bloc_vanilla/blocs/posts_bloc.dart';
import 'package:flutter_ui/src/apps/bloc_vanilla/models/post.dart';

class PostBloc extends StatefulWidget {
  @override
  _PostBlocState createState() => _PostBlocState();
}

class _PostBlocState extends State<PostBloc> {
  Widget buildList(AsyncSnapshot<List<Post>> snapshot) {
    var posts = snapshot.data;
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var post = posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
        itemCount: posts.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc'),
      ),
      body: StreamBuilder<List<Post>>(
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
        stream: bloc.allPosts,
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    bloc.fetchAllPosts();
  }
}

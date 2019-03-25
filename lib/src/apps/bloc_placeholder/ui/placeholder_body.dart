import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class PlaceHolderBody extends StatefulWidget {
  @override
  _PlaceHolderBodyState createState() => _PlaceHolderBodyState();
}

class _PlaceHolderBodyState extends State<PlaceHolderBody> {
  final _bloc = PostBloc();

  _PlaceHolderBodyState() {
    _bloc.dispatch(FetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (BuildContext context, state) {
        if (state is InitialPostState) {
          return CircularProgressIndicator();
        }
        if (state is PostsError) {
          return Text('Fail to load');
        }
        if (state is PostsLoaded) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
              itemCount: state.posts.length);
        }
      },
      bloc: _bloc,
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

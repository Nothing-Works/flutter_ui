import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../model/post.dart';
import '../repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final _postRepository = PostRepository();

  @override
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPosts) {
      if (currentState is InitialPostState) {
        try {
          final List<Post> posts = await _postRepository.fetchAll();
          yield PostsLoaded(posts);
          return;
        } catch (_) {
          yield PostsError();
        }
      }
    }
  }
}

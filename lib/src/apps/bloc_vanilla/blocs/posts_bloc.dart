import 'package:flutter_ui/src/apps/bloc_vanilla/models/post.dart';
import 'package:flutter_ui/src/apps/bloc_vanilla/repositories/post_repository.dart';
import 'package:rxdart/rxdart.dart';

class PostsBloc {
  final _postRepository = PostRepository();
  final _postFetcher = PublishSubject<List<Post>>();

  Observable<List<Post>> get allPosts => _postFetcher.stream;

  fetchAllPosts() async {
    List<Post> posts = await _postRepository.fetchAllPost();
    _postFetcher.sink.add(posts);
  }

  dispose() {
    _postFetcher.close();
  }
}

final bloc = PostsBloc();

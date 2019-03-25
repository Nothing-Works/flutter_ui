import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/post.dart';

@immutable
abstract class PostState extends Equatable {
  PostState([List props = const []]) : super(props);
}

class InitialPostState extends PostState {
  @override
  String toString() {
    return 'InitialPostState';
  }
}

class PostsLoaded extends PostState {
  final List<Post> posts;

  PostsLoaded(this.posts) : super([posts]);

  @override
  String toString() {
    return 'PostsLoaded{posts: ${posts.length}}';
  }
}

class PostsError extends PostState {
  @override
  String toString() {
    return 'PostsError';
  }
}

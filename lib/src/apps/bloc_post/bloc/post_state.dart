import 'package:equatable/equatable.dart';
import 'package:flutter_ui/src/apps/bloc_post/model/post.dart';

abstract class PostState extends Equatable {
  PostState([List props = const []]) : super(props);
}

class PostUninitialized extends PostState {
  @override
  String toString() {
    return 'PostUninitialized';
  }
}

class PostError extends PostState {
  @override
  String toString() {
    return 'PostError';
  }
}

class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  PostLoaded({this.posts, this.hasReachedMax}) : super([posts, hasReachedMax]);

  PostLoaded copyWith({List<Post> posts, bool hasReachedMax}) {
    return PostLoaded(
        posts: posts ?? this.posts,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() {
    return 'PostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
  }
}

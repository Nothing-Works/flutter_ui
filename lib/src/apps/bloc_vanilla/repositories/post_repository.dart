import 'package:flutter_ui/src/apps/bloc_vanilla/api_providers/post_api_provider.dart';
import 'package:flutter_ui/src/apps/bloc_vanilla/models/post.dart';

class PostRepository {
  final postApi = PostApiProvider();

  Future<List<Post>> fetchAllPost() => postApi.fetchAll();
}

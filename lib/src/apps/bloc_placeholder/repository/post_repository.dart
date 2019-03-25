import '../api/api_post.dart';
import '../model/post.dart';

class PostRepository {
  final _postApi = ApiPost();

  Future<List<Post>> fetchAll() async => _postApi.fetchPosts();
}

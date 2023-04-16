import '../models/post.dart';

abstract class PostsService {
  Future<List<Post>> getPosts();
  Future<Post> getPost(String id);
  Future<void> createPost(Post post);
}

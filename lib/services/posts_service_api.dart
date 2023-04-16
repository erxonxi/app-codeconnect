import 'dart:convert';

import 'package:http/http.dart';

import '../models/post.dart';
import 'posts_service.dart';

class PostsServiceApi implements PostsService {
  final Client _client = Client();

  @override
  Future<List<Post>> getPosts() async {
    final response = await _client.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return responseBody
          .map<dynamic>(
            (post) => Post.fromJson(post),
          )
          .toList();
    } else {
      throw Exception("Error");
    }
  }

  @override
  Future<void> createPost(Post post) async {
    final response = await _client.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      body: jsonEncode(post.toJson()),
    );

    if (response.statusCode == 201) {
      return;
    } else {
      throw Exception("Error");
    }
  }

  @override
  Future<Post> getPost(String id) async {
    final response = await _client.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return Post.fromJson(responseBody);
    } else {
      throw Exception("Error");
    }
  }
}

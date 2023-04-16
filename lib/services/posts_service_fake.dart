import '../models/post.dart';
import 'posts_service.dart';

class PostsServiceFake implements PostsService {
  final List<Post> _posts = [
    Post(
      id: "1",
      user: PostUser(
        id: "1",
        nickname: "@patopitu",
        email: "test@mail.com",
        avatar: "https://i.pravatar.cc/150?img=4",
      ),
      content:
          "Hey! This is the first post! I'm so excited to share this new script for you!",
      tags: ["#test", "#test2"],
      articleId: null,
    ),
    Post(
      id: "2",
      user: PostUser(
        id: "1",
        nickname: "@patopitu",
        email: "test@mail.com",
        avatar: "https://i.pravatar.cc/150?img=5",
      ),
      content:
          "Hey! This is the second post! I'm so excited to share this new script for you!",
      tags: ["#test", "#test2"],
      articleId: null,
    ),
    Post(
      id: "3",
      user: PostUser(
        id: "1",
        nickname: "@patopitu",
        email: "test@mail.com",
        avatar: "https://i.pravatar.cc/150?img=6",
      ),
      content:
          "Hey! This is the second post! I'm so excited to share this new script for you!",
      tags: ["#test", "#test2"],
      articleId: null,
    ),
    Post(
      id: "4",
      user: PostUser(
        id: "1",
        nickname: "@patopitu",
        email: "test@mail.com",
        avatar: "https://i.pravatar.cc/150?img=2",
      ),
      content:
          "Hey! This is the second post! I'm so excited to share this new script for you!",
      tags: ["#test", "#test2"],
      articleId: null,
    ),
    Post(
      id: "5",
      user: PostUser(
        id: "2",
        nickname: "@pimpinela",
        email: "test2@mail.com",
        avatar: "https://i.pravatar.cc/150?img=3",
      ),
      content:
          "Hey! This is the second post! I'm so excited to share this new script for you!",
      tags: ["#test", "#test2"],
      articleId: null,
    ),
  ];

  @override
  Future<List<Post>> getPosts() async {
    return _posts;
  }

  @override
  Future<void> createPost(Post post) async {
    _posts.add(post);
  }

  @override
  Future<Post> getPost(String id) {
    return Future.value(_posts.firstWhere((post) => post.id == id));
  }
}

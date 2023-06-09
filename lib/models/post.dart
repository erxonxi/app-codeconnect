class PostUser {
  final String id;
  final String nickname;
  final String email;
  final String? avatar;

  PostUser({
    required this.id,
    required this.nickname,
    required this.email,
    required this.avatar,
  });

  factory PostUser.fromJson(Map<String, dynamic> json) {
    return PostUser(
      id: json['id'],
      nickname: json['nickname'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'email': email,
      'avatar': avatar,
    };
  }
}

class Post {
  final String id;
  final PostUser user;
  final String? articleId;
  final String content;
  final List<String> tags;

  Post({
    required this.id,
    required this.user,
    required this.content,
    required this.articleId,
    required this.tags,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      user: json['userId'],
      content: json['title'],
      articleId: json['articleId'],
      tags: json['tags'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': user,
      'articleId': articleId,
      'title': content,
      'tags': tags,
    };
  }
}

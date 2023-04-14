import 'package:flutter/material.dart';

import '../widgets/post_card.dart';
import '../../../models/post.dart';

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });

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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              final post = _posts[index];
              return PostCard(
                  isActive: index == 0, post: post, press: () => {});
            },
          ),
        ),
        const Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: SearchInput(),
        ),
      ],
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(4.0, 4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14.0),
              ),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.grey[200],
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          ),
          style: const TextStyle(color: Colors.grey),
          cursorColor: Colors.grey,
        ),
      ),
    );
  }
}

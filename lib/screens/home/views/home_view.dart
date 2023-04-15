import 'package:flutter/material.dart';

import '../widgets/post_card.dart';
import '../../../models/post.dart';
import '../widgets/search_input.dart';

class HomeView extends StatefulWidget {
  HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _noteSelected = 0;

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
                  isActive: index == _noteSelected, post: post, press: () => {
                    setState(() {
                      _noteSelected = index;
                    })
              });
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

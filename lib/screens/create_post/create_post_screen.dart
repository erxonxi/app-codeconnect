import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/posts/posts_bloc.dart';
import '../../models/post.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String content = _contentController.text;

    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create Post'),
          ),
          floatingActionButton: content.isNotEmpty
              ? FloatingActionButton(
                  onPressed: _onFloatingButtonPressed,
                  tooltip: "Publish",
                  child: const Icon(Icons.publish_rounded),
                )
              : null,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _contentController.text += '#';
                            });
                          },
                          icon: Text(
                            "H1",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _contentController.text += '##';
                            });
                          },
                          icon: Text(
                            "H2",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _contentController.text += '###';
                            });
                          },
                          icon: Text(
                            "H3",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _contentController.text += '####';
                            });
                          },
                          icon: Text(
                            "H4",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _contentController.text += '#####';
                            });
                          },
                          icon: Text(
                            "H5",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _contentController.text += '######';
                            });
                          },
                          icon: Text(
                            "H6",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _contentController.text += '---';
                            });
                          },
                          icon: Text(
                            "HR",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _contentController.text += '```';
                            });
                          },
                          icon: Text(
                            "CODE",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _contentController.text += '[]()';
                            });
                          },
                          icon: Text(
                            "LINK",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _contentController.text += '![alt text]()';
                            });
                          },
                          icon: Text(
                            "IMG",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _contentController.text += '> ';
                            });
                          },
                          icon: Text(
                            "QUOTE",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (String value) {
                    setState(() {});
                  },
                  controller: _contentController,
                  style: const TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 1.2,
                  ),
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What\'s on your mind?',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '${content.length}/512',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: const [
                    Icon(Icons.image_rounded),
                    SizedBox(width: 16.0),
                    Icon(Icons.video_call_rounded),
                    SizedBox(width: 16.0),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onFloatingButtonPressed() {
    final String content = _contentController.text;
    final List<String> tags = content
        .split(' ')
        .where((String word) => word.startsWith('#'))
        .toList();

    if (content.isNotEmpty) {
      final PostsBloc postsBloc = context.read<PostsBloc>();

      var rng = Random();

      postsBloc.add(
        PostsCreate(
          Post(
            id: rng.nextInt(1000).toString(),
            user: PostUser(
              email: 'ruben@mail.com',
              nickname: 'ruben',
              id: '2',
              avatar: 'https://picsum.photos/200',
            ),
            content: content,
            articleId: '',
            tags: tags,
          ),
        ),
      );

      Navigator.of(context).pop(content);
    }
  }
}

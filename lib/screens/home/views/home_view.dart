import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/posts/posts_bloc.dart';
import '../../post_detail/post_detail_screen.dart';
import '../widgets/post_card.dart';
import '../widgets/search_input.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _noteSelected = 0;

  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(const PostsFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return PostCard(
                      isActive: index == _noteSelected,
                      post: post,
                      press: () {
                        setState(() {
                          _noteSelected = index;
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDetailScreen(post: post),
                          ),
                        );
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
      },
    );
  }
}

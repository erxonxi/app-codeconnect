import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/post.dart';
import '../../services/posts_service.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsService postsService;

  PostsBloc(this.postsService) : super(const PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is PostsFetch) {
        emit(const PostsLoading());
        try {
          final posts = await postsService.getPosts();
          emit(PostsLoaded(posts));
        } catch (e) {
          emit(PostsError(e.toString()));
        }
      }

      if (event is PostsCreate) {
        emit(const PostsLoading());
        try {
          await postsService.createPost(event.post);
          final posts = await postsService.getPosts();
          emit(PostsLoaded(posts));
        } catch (e) {
          emit(PostsError(e.toString()));
        }
      }
    });
  }
}

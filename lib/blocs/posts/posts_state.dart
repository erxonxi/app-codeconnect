part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  final List<Post> posts;

  const PostsState(this.posts);
}

class PostsInitial extends PostsState {
  const PostsInitial([super.posts = const []]);

  @override
  List<Object> get props => [posts];
}

class PostsLoading extends PostsState {
  const PostsLoading([super.posts = const []]);

  @override
  List<Object> get props => [posts];
}

class PostsLoaded extends PostsState {
  const PostsLoaded(super.posts);

  @override
  List<Object> get props => [posts];
}

class PostsError extends PostsState {
  final String message;

  const PostsError(this.message, [super.posts = const []]);

  @override
  List<Object> get props => [posts, message];
}

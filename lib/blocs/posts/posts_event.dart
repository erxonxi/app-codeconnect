part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
}

class PostsFetch extends PostsEvent {
  const PostsFetch();

  @override
  List<Object> get props => [];
}

class PostsCreate extends PostsEvent {
  final Post post;

  const PostsCreate(this.post);

  @override
  List<Object> get props => [post];
}

import 'package:equatable/equatable.dart';
import 'package:fire/Features/Posts/Domain/Entities/post_entity.dart';

abstract class PostStatus extends Equatable {
  const PostStatus();
  @override
  List<Object?> get props => [];
}

class PostIntialState extends PostStatus {}

class PostLoadingState extends PostStatus {}

class PostLoadedState extends PostStatus {
  final List<PostsEntity> posts;
  PostLoadedState({required this.posts});
  @override
  List<Object?> get props => [posts];
}

class ErrorPostState extends PostStatus {
  final String message;

  ErrorPostState({required this.message});
  @override
  List<Object?> get props => [message];
}

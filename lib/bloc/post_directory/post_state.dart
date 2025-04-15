import 'package:equatable/equatable.dart';
import 'package:post_app/model/post_model.dart';


abstract class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostLoading extends PostState {}
class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded(this.posts);

  @override
  List<Object?> get props => [posts];
}
class PostError extends PostState {
  final String error;
  PostError(this.error);

  @override
  List<Object?> get props => [error];
}

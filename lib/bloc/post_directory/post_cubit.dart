import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/repository/post_repository.dart';
import '../../model/post_model.dart';
import 'post_state.dart';


class PostCubit extends Cubit<PostState> {
  final PostRepository postRepository;

  PostCubit(this.postRepository) : super(PostLoading());

  void fetchPosts() {
    // postRepository.getPostsStream().listen(
    //       (posts) => emit(PostLoaded(posts)),
    //   onError: (e) => emit(PostError(e.toString())),
    // );
  }

  Future<void> addPost(String message, String username) async {
    //await postRepository.addPost(Post(message: message, username: username, timestamp: DateTime.now()));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_directory/post_cubit.dart';
import '../bloc/post_directory/post_state.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final String username;

  HomeScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    final postCubit = context.read<PostCubit>();
    postCubit.fetchPosts();

    return Scaffold(
      appBar: AppBar(title: Text("Social Posts")),
      body: Column(
        children: [
          Expanded(child: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if (state is PostLoading) return Center(child: CircularProgressIndicator());
              if (state is PostLoaded) {
                return ListView(
                  children: state.posts
                      .map((post) => ListTile(title: Text(post.username), subtitle: Text(post.message)))
                      .toList(),
                );
              }
              return SizedBox();
            },
          )),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller)),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    postCubit.addPost(_controller.text, username);
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

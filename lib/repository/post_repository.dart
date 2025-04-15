import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/post_model.dart';


class PostRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Post>> getPosts() {
    return _firestore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Post.fromFirestore(doc.data()))
        .toList());
  }

  Future<void> createPost(Post post) async {
    await _firestore.collection('posts').add(post.toFirestore());
  }
}

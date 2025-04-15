import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String message;
  final String username;
  final DateTime timestamp;

  Post({required this.message, required this.username, required this.timestamp});

  factory Post.fromFirestore(Map<String, dynamic> json) {
    return Post(
      message: json['message'],
      username: json['username'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'message': message,
      'username': username,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}

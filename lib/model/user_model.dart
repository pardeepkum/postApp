class AppUser {
  final String uid;
  final String username;
  final String email;

  AppUser({required this.uid, required this.username, required this.email});

  factory AppUser.fromFirestore(Map<String, dynamic> json, String uid) {
    return AppUser(
      uid: uid,
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'username': username,
      'email': email,
    };
  }
}

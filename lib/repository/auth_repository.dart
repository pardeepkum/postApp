import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';


class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AppUser?> signUp(String email, String password, String username) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = AppUser(uid: userCredential.user!.uid, username: username, email: email);

    await _firestore.collection('users').doc(user.uid).set(user.toFirestore());

    return user;
  }

  Future<AppUser?> logIn(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final snapshot = await _firestore.collection('users').doc(userCredential.user!.uid).get();
    return AppUser.fromFirestore(snapshot.data()!, snapshot.id);
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}

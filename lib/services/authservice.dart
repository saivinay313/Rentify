import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthBase {
  User get currentUser;

  Stream<User> authStateChanges();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<User> signout();
}

class Auth implements AuthBase {
  final _firebaseauth = FirebaseAuth.instance;
  @override
  Stream<User> authStateChanges() => _firebaseauth.authStateChanges();
  User get currentUser => _firebaseauth.currentUser;
  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseauth.signInWithCredential(
        EmailAuthProvider.credential(email: email, password: password));
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseauth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<User> signout() async {
    await _firebaseauth.signOut();
  }
}

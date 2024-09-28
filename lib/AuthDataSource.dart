// data/datasources/firebase_auth_datasource.dart
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthDataSource {
  Future<User?> signInWithEmail(String email, String password);
  Future<void> signOut();
  Future<User?> getCurrentUser();
  Future<User?> signUpWithEmail(String email, String password);
}

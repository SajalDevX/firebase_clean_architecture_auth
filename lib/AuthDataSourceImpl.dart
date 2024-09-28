import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'UserEntity.dart';

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final firebase.FirebaseAuth _firebaseAuth;

  FirebaseAuthDataSourceImpl(this._firebaseAuth);

  Future<User?> signIn(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return User(id: result.user!.uid, email: result.user!.email!);
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  User? getCurrentUser() {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser != null) {
      return User(id: firebaseUser.uid, email: firebaseUser.email!);
    }
    return null;
  }

}

abstract class FirebaseAuthDataSource{
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
}

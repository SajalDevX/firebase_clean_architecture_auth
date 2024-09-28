import 'package:firebase_auth/firebase_auth.dart';
import 'AuthDataSource.dart';
import 'UserEntity.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth firebaseAuth;

  AuthDataSourceImpl(this.firebaseAuth);

  @override
  Future<UserEntity> signInWithEmail(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return UserEntity(
        id: userCredential.user!.uid, email: userCredential.user!.email!);
  }

  @override
  Future<UserEntity> signUpWithEmail(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return UserEntity(
        id: userCredential.user!.uid, email: userCredential.user!.email!);
  }

  @override
  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      return UserEntity(id: user.uid, email: user.email!);
    }
    return null;
  }
}

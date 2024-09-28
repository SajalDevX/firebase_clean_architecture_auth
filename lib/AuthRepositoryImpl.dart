import 'package:firebase_auth/firebase_auth.dart';

import 'AuthRepository.dart';
import 'UserEntity.dart';

class FirebaseAuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthRepositoryImpl(this.firebaseAuth);

  @override
  Future<UserEntity> signInWithEmail(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return UserEntity(id: userCredential.user!.uid, email: userCredential.user!.email!);
  }

  @override
  Future<UserEntity> signUpWithEmail(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return UserEntity(id: userCredential.user!.uid, email: userCredential.user!.email!);
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

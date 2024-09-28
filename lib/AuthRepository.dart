import 'UserEntity.dart';

abstract class AuthRepository {
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
  User? getCurrentUser();
}

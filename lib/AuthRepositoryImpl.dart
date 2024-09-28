import 'AuthDataSourceImpl.dart';
import 'AuthRepository.dart';
import 'UserEntity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<User?> signIn(String email, String password) {
    return dataSource.signIn(email, password);
  }

  @override
  Future<void> signOut() {
    return dataSource.signOut();
  }

  @override
  User? getCurrentUser() {
    return dataSource.getCurrentUser();
  }
}

import 'AuthRepository.dart';
import 'AuthUseCase.dart';
import 'UserEntity.dart';

class AuthUseCaseImpl implements AuthUseCase {
  final AuthRepository repository;

  AuthUseCaseImpl(this.repository);

  @override
  Future<UserEntity> signInWithEmail(String email, String password) async {
    return await repository.signInWithEmail(email, password);
  }

  @override
  Future<UserEntity> signUpWithEmail(String email, String password) async {
    return await repository.signUpWithEmail(email, password);
  }

  @override
  Future<void> signOut() async {
    return await repository.signOut();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    return await repository.getCurrentUser();
  }
}

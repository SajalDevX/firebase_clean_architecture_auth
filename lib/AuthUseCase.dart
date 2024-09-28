
import 'AuthRepository.dart';
import 'UserEntity.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<User?> execute(String email, String password) {
    return repository.signIn(email, password);
  }
}



class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<void> execute() {
    return repository.signOut();
  }
}




import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Import your files
import 'AuthBloc.dart';
import 'AuthDataSourceImpl.dart';
import 'AuthRepository.dart';
import 'AuthRepositoryImpl.dart';
import 'AuthUseCase.dart';

final sl = GetIt.instance;

void init() {
  // Firebase Auth instance
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Data Source
  sl.registerLazySingleton(() => FirebaseAuthDataSource(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  // Bloc
  sl.registerFactory(() => AuthBloc(sl(), sl()));
}

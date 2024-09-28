import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'AuthBloc.dart';
import 'AuthRepository.dart';
import 'AuthRepositoryImpl.dart';
import 'AuthUseCase.dart';
import 'AuthUseCaseImpl.dart';

final sl = GetIt.instance;

void init() {
  // Firebase
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton<AuthUseCase>(() => AuthUseCaseImpl(sl()));

  // Blocs
  sl.registerFactory(() => AuthBloc(sl()));
}

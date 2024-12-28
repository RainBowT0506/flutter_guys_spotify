import 'package:flutter_guys_spotify/data/repository/suth/auth_repository_impl.dart';
import 'package:flutter_guys_spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_guys_spotify/domain/repository/auth/auth.dart';
import 'package:flutter_guys_spotify/domain/usecases/auth/signin.dart';
import 'package:flutter_guys_spotify/domain/usecases/auth/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}

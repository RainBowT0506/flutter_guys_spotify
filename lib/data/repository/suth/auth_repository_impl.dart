import 'package:flutter_guys_spotify/data/models/auth/create_user_req.dart';
import 'package:flutter_guys_spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_guys_spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq createUserReq) async {
    await sl<AuthFirebaseService>().signup(createUserReq);
  }
}

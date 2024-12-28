import 'package:dartz/dartz.dart';
import 'package:flutter_guys_spotify/data/models/auth/create_user_req.dart';
import 'package:flutter_guys_spotify/domain/repository/auth/auth.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}

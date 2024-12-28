import 'package:dartz/dartz.dart';
import 'package:flutter_guys_spotify/data/models/auth/signin_user_req.dart';
import 'package:flutter_guys_spotify/domain/repository/auth/auth.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
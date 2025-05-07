import 'package:dartz/dartz.dart';
import 'package:test_applicarion/feature/login/data/model/login_model.dart';

import '../../../core/network/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> login({
    required String username,
    required String password,
    required String grantType,
    required String scope,
  });
}

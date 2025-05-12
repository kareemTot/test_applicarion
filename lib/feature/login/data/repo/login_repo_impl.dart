import 'package:dartz/dartz.dart';
import 'package:test_applicarion/core/network/errors/failure.dart';
import 'package:test_applicarion/feature/login/data/model/login_model.dart';
import 'package:test_applicarion/feature/login/data/source/base/login_source.dart';
import 'package:test_applicarion/feature/login/domain/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginSource _source;

  LoginRepoImpl(this._source);
  @override
  Future<Either<Failure, LoginModel>> login({
    required String username,
    required String password,
    required String grantType,
    required String scope,
  }) async {
    try {
      final response = await _source.login(
        username: username,
        password: password,
        grantType: grantType,
        scope: scope,
      );

      if (response['access_token'] == null) {
        return Left(ServerFailure(response['error']));
      } else {
        return Right(LoginModel.fromJson(response));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

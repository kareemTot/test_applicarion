import 'dart:developer';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network.dart';
import '../../domain/repo/repo.dart';
import '../data.dart';

class FullfilmentCenterRepoImpelement implements FullfilmentCenterRepo {
  final FullfilmentCenterSource _source;

  FullfilmentCenterRepoImpelement(this._source);
  @override
  Future<Either<Failure, FullfilmentCenterModel>> getFullfilmentCenter() async {
    try {
      final response = await _source.getFullfilmentCenter();
      log("${response['fulfillmentCenters']}");
      log("this is reponse ${response.toString()}");
      return Right(FullfilmentCenterModel.fromJson(response));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

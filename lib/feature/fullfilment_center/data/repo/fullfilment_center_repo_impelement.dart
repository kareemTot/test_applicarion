import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:test_applicarion/core/network/errors/failure.dart';
import 'package:test_applicarion/feature/fullfilment_center/data/source/base/fullfilment_center_source.dart';
import 'package:test_applicarion/feature/fullfilment_center/domain/repo/fullfilment_center_repo.dart';

import '../model/fullfilment_center_model/fullfilment_center_model.dart';

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

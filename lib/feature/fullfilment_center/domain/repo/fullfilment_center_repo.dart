import 'package:dartz/dartz.dart';
import 'package:test_applicarion/core/network/errors/failure.dart';
import '../../data/model/fullfilment_centers_model/fullfilment_center_model.dart';

abstract class FullfilmentCenterRepo {
  Future<Either<Failure, FullfilmentCenterModel>> getFullfilmentCenter();
}

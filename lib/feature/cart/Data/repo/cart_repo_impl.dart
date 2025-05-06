import 'package:dartz/dartz.dart';
import 'package:test_applicarion/core/network/errors/failure.dart';
import 'package:test_applicarion/feature/cart/Data/Model/cart_model/cart_model.dart';
import 'package:test_applicarion/feature/cart/Data/Model/update_order_dynamic_property_model/update_order_dynamic_property_model.dart';
import 'package:test_applicarion/feature/cart/Data/source/base/cart_source.dart';
import 'package:test_applicarion/feature/cart/domain/repo/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartSource _source;

  CartRepoImpl(this._source);
  @override
  Future<Either<Failure, UpdateOrderDynamicPropertyModel>>
  updateOrderDynamicProperties({required String orderId}) async {
    try {
      final result = await _source.updateOrderDynamicProperties(
        orderId: orderId,
      );
      if (result['updateOrderDynamicProperties'] == null) {
        return Left(ServerFailure(result['errors'][0]['message']));
      } else {
        return Right(
          UpdateOrderDynamicPropertyModel.fromJson(
            result['updateOrderDynamicProperties'],
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> cartInfo() async {
    try {
      final result = await _source.cartInfo();
      if (result['cart'] == null) {
        return Left(ServerFailure(result['errors'][0]['message']));
      } else {
        return Right(CartModel.fromJson(result['cart']));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

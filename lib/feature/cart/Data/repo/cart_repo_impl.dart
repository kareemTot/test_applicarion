import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:test_applicarion/feature/cart/Data/Model/create_order_model/create_order_model.dart';
import 'package:test_applicarion/feature/cart/Data/Model/update_order_payment_model/update_order_payment_model.dart';
import '../../../../../core/network/network.dart';
import '../../domain/repo/repo.dart';
import '../data.dart';

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

  @override
  Future<Either<Failure, String>> onlinePayment({
    required String orderId,
  }) async {
    try {
      final result = await _source.onlinePayment(orderId: orderId);
      if (result['Item3'] == null) {
        return Left(ServerFailure(result['errors'][0]['message']));
      } else {
        log("Session ID${result['Item3']}");
        return Right(result['Item3']);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateOrderModel>> createOrderFromCart({
    required String cartId,
  }) async {
    try {
      final result = await _source.createOrder(cartId: cartId);
      if (result['createOrderFromCart'] == null) {
        return Left(ServerFailure(result['errors'][0]['message']));
      } else {
        return Right(CreateOrderModel.fromJson(result['createOrderFromCart']));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateOrderPaymentModel>> updateOrderPayemnt({
    required String orderId,
    required double amount,
  }) async {
    try {
      final response = await _source.updateOrderPayment(
        orderId: orderId,
        amount: amount,
      );
      if (response['addOrUpdateOrderPayment'] == null) {
        return Left(ServerFailure(response['errors'][0]['message']));
      } else {
        return Right(
          UpdateOrderPaymentModel.fromJson(response['addOrUpdateOrderPayment']),
        );
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

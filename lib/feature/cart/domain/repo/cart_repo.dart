import 'package:dartz/dartz.dart';
import 'package:test_applicarion/core/network/errors/failure.dart';
import 'package:test_applicarion/feature/cart/Data/Model/carts_model/cart_model.dart';
import 'package:test_applicarion/feature/cart/Data/Model/create_order_model/create_order_model.dart';
import 'package:test_applicarion/feature/cart/Data/Model/update_order_payment_model/update_order_payment_model.dart';
import '../../Data/Model/updated_orders_dynamic_property_model/update_order_dynamic_property_model.dart';

abstract class CartRepo {
  Future<Either<Failure, UpdateOrderDynamicPropertyModel>>
  updateOrderDynamicProperties({required String orderId});

  Future<Either<Failure, CartModel>> cartInfo();
  Future<Either<Failure, String>> onlinePayment({required String orderId});
  Future<Either<Failure, CreateOrderModel>> createOrderFromCart({
    required String cartId,
  });

  Future<Either<Failure, UpdateOrderPaymentModel>> updateOrderPayemnt({
    required String orderId,
    required double amount,
  });
}

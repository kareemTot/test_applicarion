import 'package:dartz/dartz.dart';
import 'package:test_applicarion/core/network/errors/failure.dart';
import 'package:test_applicarion/feature/cart/Data/Model/cart_model/cart_model.dart';

import '../../Data/Model/update_order_dynamic_property_model/update_order_dynamic_property_model.dart';

abstract class CartRepo {
  Future<Either<Failure, UpdateOrderDynamicPropertyModel>>
  updateOrderDynamicProperties({required String orderId});

  Future<Either<Failure, CartModel>> cartInfo();
}

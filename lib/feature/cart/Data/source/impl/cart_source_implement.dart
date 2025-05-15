import 'dart:convert';
import 'dart:developer';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/core/network/dio/base_dio.dart';
import 'package:test_applicarion/feature/cart/Data/service/cart_ql.dart';
import 'package:test_applicarion/feature/cart/Data/service/update_order_payment.dart';
import 'package:test_applicarion/feature/cart/Data/source/base/cart_source.dart';

import '../../service/create_order_ql.dart';
import '../../service/update_order_dynamic_property_ql.dart';

class CartSourceImplement implements CartSource {
  final GraphQLClient client;
  final BaseDio _dio;

  CartSourceImplement(this.client, this._dio);
  @override
  Future<Map<String, dynamic>> updateOrderDynamicProperties({
    required String orderId,
  }) async {
    try {
      final option = MutationOptions(
        document: gql(updateOrderDynamicPropertiesQL),
        variables: {'id': orderId},
      );
      final result = await client.mutate(option);
      if (result.hasException) {
        log(result.exception.toString());
        throw result.exception.toString();
      }
      log(result.data.toString());
      return result.data!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> cartInfo() async {
    try {
      final option = QueryOptions(document: gql(cartQl));
      final result = await client.query(option);
      if (result.hasException) {
        throw result.exception.toString();
      }
      log(result.data.toString());
      return result.data!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> onlinePayment({required String orderId}) async {
    try {
      final reponse = await _dio.post(
        "api/payments/an/QnbInitializePayment/$orderId",
      );
      return json.decode(reponse.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> createOrder({required String cartId}) async {
    try {
      final reposnse = await client.mutate(
        MutationOptions(
          document: gql(createOrderQl),
          variables: {'id': cartId},
        ),
      );
      if (reposnse.hasException) {
        log(reposnse.exception.toString());
        throw reposnse.exception.toString();
      }
      return reposnse.data!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateOrderPayment({
    required String orderId,
    required double amount,
  }) async {
    try {
      final response = await client.mutate(
        MutationOptions(
          document: gql(updateOrderPaymentQl),
          variables: {'id': orderId, 'amount': amount},
        ),
      );
      if (response.hasException) {
        log(response.exception.toString());
        throw response.exception.toString();
      }
      return response.data!;
    } catch (e) {
      rethrow;
    }
  }
}

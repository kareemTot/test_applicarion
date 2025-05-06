import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/feature/cart/Data/service/cart_ql.dart';
import 'package:test_applicarion/feature/cart/Data/source/base/cart_source.dart';

import '../../service/update_order_dynamic_property_ql.dart';

class CartSourceImplement implements CartSource {
  final GraphQLClient client;

  CartSourceImplement(this.client);
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
}

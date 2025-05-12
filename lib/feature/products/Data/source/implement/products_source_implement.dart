import 'dart:developer';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../../cart/Data/service/add_item_to_cart_mut.dart';
import '../../service/product_details_ql.dart';
import '../base/products_source.dart';

class ProductsSourceImplement implements ProductsSource {
  final GraphQLClient client;

  ProductsSourceImplement(this.client);
  @override
  Future<Map<String, dynamic>> getProductDetails({
    required String productId,
  }) async {
    try {
      final option = QueryOptions(
        document: gql(productDetailsQl),
        variables: {'id': productId},
      );
      final result = await client.query(option);
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
  Future<Map<String, dynamic>> addItemToCart({
    required String productId,
    String? fullfilmentCenterId,
  }) async {
    try {
      final option = MutationOptions(
        document: gql(addItemToCartMut),
        variables: {'id': productId, 'fulfillmentId': fullfilmentCenterId},
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
}

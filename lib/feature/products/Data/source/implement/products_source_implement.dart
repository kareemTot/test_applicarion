import 'dart:developer';
import 'package:graphql_flutter/graphql_flutter.dart';
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
}

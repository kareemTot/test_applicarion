import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/feature/fullfilment_center/data/service/fullfilment_center_ql.dart';

import '../base/fullfilment_center_source.dart';

class FullfilmentCenterSourceImplement implements FullfilmentCenterSource {
  final GraphQLClient client;

  FullfilmentCenterSourceImplement(this.client);
  @override
  Future<Map<String, dynamic>> getFullfilmentCenter() async {
    try {
      final option = QueryOptions(document: gql(getFullfilmentCenterQuery));
      final result = await client.query(option);

      if (result.hasException) {
        log(result.exception.toString());
        throw result.exception.toString();
      }
      return result.data!;
    } catch (e) {
      rethrow;
    }
  }
}

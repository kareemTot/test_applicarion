import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/feature/cart/presentation/widget/custom_row_text.dart';

import '../service/get_all_user_orders_ql.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders'), centerTitle: true),
      body: Query(
        options: QueryOptions(document: gql(getAllUserOrdersQl)),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (result.hasException) {
            return Center(
              child: Text(
                result.exception.toString(),
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            );
          } else {
            final orders = result.data?['orders']?['items'] ?? 0 as List;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListView.separated(
                itemBuilder: (context, i) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        CustomRowText(
                          title: "Order Number:",
                          value: " ${orders[i]['id']}",
                        ),
                        Divider(),
                        CustomRowText(
                          title: "Total:",
                          value: " ${orders[i]['total']['formattedAmount']}",
                        ),
                        Divider(),
                        CustomRowText(
                          title: "Status:",
                          value: " ${orders[i]['status']}",
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, i) {
                  return SizedBox(height: 16);
                },
                itemCount: orders.length,
              ),
            );
          }
        },
      ),
    );
  }
}

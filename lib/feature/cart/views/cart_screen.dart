import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/feature/cart/service/cart_ql.dart';
import 'package:test_applicarion/feature/cart/widget/custom_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Screen'), centerTitle: true),
      body: Query(
        options: QueryOptions(document: gql(cartQl)),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (result.hasException) {
            return Center(child: Text(result.exception.toString()));
          }
          if (result.data != null) {
            final newCarts = result.data?['carts']?['items'] ?? 0;
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Cart Items (${newCarts.length})",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: newCarts.length,
                    itemBuilder: (context, index) {
                      final item = newCarts[index];
                      return CustomCartItem(
                        image:
                            item['image'] != null
                                ? Image.network(
                                  item['image'],
                                  fit: BoxFit.cover,
                                )
                                : Icon(Icons.shopping_bag, size: 40),
                        title: item['name'] ?? 'Product Name',
                        pricr:
                            '\$${item['price']?.toStringAsFixed(2) ?? '0.00'}',
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

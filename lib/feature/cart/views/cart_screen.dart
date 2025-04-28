import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/feature/cart/service/cart_ql.dart';
import 'package:test_applicarion/feature/cart/service/remove_item_from_cart.dart';
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
            final newCarts = result.data?['cart']['items'] ?? 0;

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Carts (${newCarts.length})",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: newCarts.length,
                    itemBuilder: (context, index) {
                      final item = newCarts[index];
                      return Mutation(
                        options: MutationOptions(
                          document: gql(removeItemFromCart),
                          variables: {'id': item['id']},
                          onCompleted: (data) {
                            log("Item ${item['id']} removed from cart");
                            refetch?.call();
                          },
                          onError: (error) {
                            log("error $error");
                          },
                        ),
                        builder:
                            (runMutation, result) => CustomCartItem(
                              image:
                                  item['imageUrl'] != null
                                      ? Image.network(
                                        item['imageUrl'],
                                        fit: BoxFit.cover,
                                      )
                                      : Icon(Icons.shopping_bag, size: 40),
                              title: item['name']
                                  .toString()
                                  .split(' ')
                                  .take(5)
                                  .join(" "),
                              price:
                                  '\$${item['price']?.toStringAsFixed(2) ?? '0.00'}',
                              quantity: item['quantity'] ?? 0,
                              onPressed: () {
                                runMutation({'id': item['id']});
                              },
                            ),
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

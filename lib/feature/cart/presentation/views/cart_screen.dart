import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/core/constant/constant.dart';
import 'package:test_applicarion/feature/cart/Data/service/cart_ql.dart';
import 'package:test_applicarion/feature/cart/Data/service/remove_all_cart_item.dart';
import 'package:test_applicarion/feature/cart/Data/service/remove_item_from_cart.dart';
import 'package:test_applicarion/feature/cart/presentation/views/order_summary.dart';
import 'package:test_applicarion/feature/cart/presentation/widget/custom_cart_item.dart';

import '../../../../core/widget/custom_app_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Query(
        options: QueryOptions(document: gql(cartQl)),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (result.hasException) {
            log(result.exception.toString());
            return Center(child: Text(result.exception.toString()));
          }
          if (result.data != null) {
            final newCarts = result.data?['cart']['items'] ?? 0 as List;

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: newCarts.isNotEmpty,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Carts (${newCarts.length})",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Mutation(
                              options: MutationOptions(
                                document: gql(clearAllItem),
                                onCompleted: (data) {
                                  refetch?.call();
                                },
                              ),

                              builder:
                                  (runMutation, result) => GestureDetector(
                                    onTap: () {
                                      runMutation({});
                                    },
                                    child: Text(
                                      "Clear All Cart Items ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: newCarts.isNotEmpty,
                        child: Text(
                          "Total ${result.data?['cart']['total']['formattedAmount']}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
                                      : Image.network(image),
                              title: item['name']
                                  .toString()
                                  .split(' ')
                                  .take(5)
                                  .join(" "),
                              price:
                                  "${item['extendedPrice']['formattedAmount']}",
                              quantity: item['quantity'] ?? 0,
                              onPressed: () {
                                runMutation({'id': item['id']});
                              },
                            ),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: newCarts.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomAppButton(
                      height: 44,
                      text: "Checkout",
                      containerColor: Colors.orange,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderSummaryScreen(),
                          ),
                        );
                      },
                    ),
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

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/core/func/show_toast.dart';
import 'package:test_applicarion/core/widget/custom_app_button.dart';
import 'package:test_applicarion/feature/cart/views/payment_screen.dart';
import 'package:test_applicarion/feature/cart/widget/custom_row_text.dart';

import '../service/cart_ql.dart';
import '../service/create_order_ql.dart';
import 'add_address_screen.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Summary'), centerTitle: true),
      body: Query(
        options: QueryOptions(document: gql(cartQl)),

        builder: (result, {fetchMore, refetch}) {
          final cart = result.data?['cart'];
          final shipments = result.data?['cart']['shipments'] as List?;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              spacing: 16,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price Summary",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(),
                          CustomRowText(
                            title: "Subtotal",
                            value: "${cart['subTotal']['formattedAmount']}",
                          ),
                          Divider(),
                          CustomRowText(
                            title: "Tax Total",
                            value: "${cart['taxTotal']['formattedAmount']}",
                          ),
                          Divider(),
                          CustomRowText(
                            title: "Shipping Total",
                            value:
                                "${cart['shippingPrice']['formattedAmount']}",
                          ),
                          Divider(),
                          CustomRowText(
                            title: "shippingTotal",
                            value:
                                "${cart['shippingTotal']['formattedAmount']}",
                          ),
                          Divider(),
                          CustomRowText(
                            title: "Total",
                            value: "${cart['total']['formattedAmount']}",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: shipments!.isNotEmpty,
                  child: Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              "Shipping Address",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(),
                            CustomRowText(
                              title: "Name",
                              value:
                                  "${shipments.firstOrNull?['deliveryAddress']['firstName']}",
                            ),
                            Divider(),
                            CustomRowText(
                              title: "Last Name",
                              value:
                                  "${shipments.firstOrNull?['deliveryAddress']['lastName']}",
                            ),
                            Divider(),
                            CustomRowText(
                              title: "Line 1",
                              value:
                                  "${shipments.firstOrNull?['deliveryAddress']['line1']}",
                            ),
                            Divider(),
                            CustomRowText(
                              title: "City",
                              value:
                                  "${shipments.firstOrNull?['deliveryAddress']['city']}",
                            ),
                            Divider(),
                            CustomRowText(
                              title: "Country",
                              value:
                                  "${shipments.firstOrNull?['deliveryAddress']['countryName']}",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Mutation(
                  options: MutationOptions(
                    document: gql(createOrderQl),
                    variables: {'id': cart['id']},
                    onError: (error) {
                      log(error.toString());
                    },
                    onCompleted: (mutationData) {
                      if (mutationData != null) {
                        showToast(
                          message: "Order is created successfully",
                          backgroundColor: Colors.green,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(),
                          ),
                        );
                      }
                    },
                  ),
                  builder:
                      (runMutation, mutationResult) =>
                          mutationResult!.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : CustomAppButton(
                                text:
                                    shipments.isEmpty
                                        ? "Add Address"
                                        : "Create Order",
                                onPressed: () {
                                  shipments.isEmpty
                                      ? Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => AddAddressScreen(
                                                shipmentId:
                                                    shipments
                                                        .firstOrNull?['id'],
                                                cartId:
                                                    result.data?['cart']['id'],
                                              ),
                                        ),
                                      )
                                      : runMutation({'id': cart['id']});
                                },
                                containerColor: Colors.orange,
                              ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

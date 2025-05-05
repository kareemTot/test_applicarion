import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/core/func/show_toast.dart';
import 'package:test_applicarion/core/widget/custom_app_button.dart';
import 'package:test_applicarion/di.dart';
import 'package:test_applicarion/feature/cart/Data/service/update_order_payment.dart';
import 'package:test_applicarion/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:test_applicarion/feature/cart/presentation/widget/custom_row_text.dart';
import '../../../bottom_nav_bar/bottom_nav_bar.dart';
import '../../Data/service/cart_ql.dart';
import '../../Data/service/create_order_ql.dart';
import 'add_address_screen.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GraphQLClient client = GraphQLProvider.of(context).value;

    return BlocProvider(
      create: (context) => CartCubit(getIt()),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is UpdateOrderDynamicPropertiesLoadingState) {
            Center(child: CircularProgressIndicator());
          } else if (state is UpdateOrderDynamicPropertiesErrorState) {
            showToast(message: state.message, backgroundColor: Colors.red);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Order Summary'),
              centerTitle: true,
            ),
            body: Query(
              options: QueryOptions(document: gql(cartQl)),
              builder: (result, {fetchMore, refetch}) {
                final cart = result.data?['cart'];
                final shipments = result.data?['cart']['shipments'] as List?;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Price Summary",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(),
                                CustomRowText(
                                  title: "Subtotal",
                                  value:
                                      "${cart['subTotal']['formattedAmount']}",
                                ),
                                const Divider(),
                                CustomRowText(
                                  title: "Tax Total",
                                  value:
                                      "${cart['taxTotal']['formattedAmount']}",
                                ),
                                const Divider(),
                                CustomRowText(
                                  title: "Shipping Total",
                                  value:
                                      "${cart['shippingPrice']['formattedAmount']}",
                                ),
                                const Divider(),
                                CustomRowText(
                                  title: "shippingTotal",
                                  value:
                                      "${cart['shippingTotal']['formattedAmount']}",
                                ),
                                const Divider(),
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
                        visible: shipments?.isNotEmpty ?? false,
                        child: Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Shipping Address",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Divider(),
                                  CustomRowText(
                                    title: "Name",
                                    value:
                                        "${shipments?.firstOrNull?['deliveryAddress']['firstName']}",
                                  ),
                                  const Divider(),
                                  CustomRowText(
                                    title: "Last Name",
                                    value:
                                        "${shipments?.firstOrNull?['deliveryAddress']['lastName']}",
                                  ),
                                  const Divider(),
                                  CustomRowText(
                                    title: "Line 1",
                                    value:
                                        "${shipments?.firstOrNull?['deliveryAddress']['line1']}",
                                  ),
                                  const Divider(),
                                  CustomRowText(
                                    title: "City",
                                    value:
                                        "${shipments?.firstOrNull?['deliveryAddress']['city']}",
                                  ),
                                  const Divider(),
                                  CustomRowText(
                                    title: "Country",
                                    value:
                                        "${shipments?.firstOrNull?['deliveryAddress']['countryName']}",
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
                            showToast(
                              message:
                                  "Failed to create order: ${error.toString()}",
                              backgroundColor: Colors.red,
                            );
                          },
                          onCompleted: (mutationData) async {
                            if (mutationData != null) {
                              final orderId =
                                  mutationData['createOrderFromCart']['id'];
                              final amount =
                                  mutationData['createOrderFromCart']['total']['amount'];
                              try {
                                final secondResult = await client.mutate(
                                  MutationOptions(
                                    document: gql(updateOrderPayment),
                                    variables: {
                                      'id': orderId,
                                      'amount': amount,
                                    },
                                    onError: (error) {
                                      log(error.toString());
                                    },
                                    onCompleted: (data) {
                                      if (data != null) {
                                        log(
                                          "============ Payment Updated ans this data : ${data.toString()}",
                                        );
                                        showToast(
                                          message: "Order created successfully",
                                          backgroundColor: Colors.green,
                                        );
                                      }
                                    },
                                  ),
                                );

                                if (secondResult.hasException) {
                                  log(
                                    "===========================${secondResult.hasException}",
                                  );
                                }

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const BottomNavBarScreen(),
                                  ),
                                );
                              } catch (e) {
                                log(e.toString());
                              }
                              Future.wait([
                                cubit.updateOrderDynamicProperties(
                                  orderId: orderId,
                                ),
                              ]);
                            }
                          },
                        ),
                        builder: (runMutation, mutationResult) {
                          if (mutationResult!.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return CustomAppButton(
                            text:
                                shipments?.isEmpty ?? true
                                    ? "Add Address"
                                    : "Create Order",
                            onPressed: () {
                              if (shipments?.isEmpty ?? true) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => AddAddressScreen(
                                          shipmentId:
                                              shipments?.firstOrNull?['id'],
                                          cartId: result.data?['cart']['id'],
                                        ),
                                  ),
                                );
                              } else {
                                runMutation({'id': cart['id']});
                              }
                            },
                            containerColor: Colors.orange,
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

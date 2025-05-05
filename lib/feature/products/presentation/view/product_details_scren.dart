import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/core/constant/constant.dart';
import 'package:test_applicarion/core/widget/custom_app_button.dart';
import 'package:test_applicarion/di.dart';
import 'package:test_applicarion/feature/cart/presentation/widget/custom_row_text.dart';
import 'package:test_applicarion/feature/products/presentation/cubit/product_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/Data/service/add_item_to_cart_mut.dart';

class ProductDetailsScren extends StatelessWidget {
  final String id;
  const ProductDetailsScren({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductDetailsCubit(getIt())..getProductDetails(productId: id),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          final cubit = context.read<ProductDetailsCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Product Details'),
              centerTitle: true,
            ),
            body:
                state is ProductDetailsLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                      children: [
                        Image.network(
                          cubit
                                  .productDetailsModel
                                  ?.product
                                  ?.images
                                  ?.firstOrNull
                                  ?.url ??
                              image,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.fill,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 16,
                            children: [
                              CustomRowText(
                                title:
                                    cubit.productDetailsModel?.product?.name ??
                                    '',
                                value:
                                    cubit.productDetailsModel?.product?.code ??
                                    '',
                              ),
                              cubit
                                          .productDetailsModel
                                          ?.product
                                          ?.hasVariations ==
                                      true
                                  ? SizedBox(
                                    height: 100,
                                    child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return Text(
                                          cubit
                                                  .productDetailsModel
                                                  ?.product
                                                  ?.variations?[index]
                                                  .name ??
                                              "",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      },
                                      itemCount:
                                          cubit
                                              .productDetailsModel
                                              ?.product
                                              ?.variations
                                              ?.length ??
                                          0,
                                      separatorBuilder:
                                          (_, __) => const Divider(),
                                    ),
                                  )
                                  : Text(
                                    "Quantity: ${cubit.productDetailsModel?.product?.maxQuantity}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Mutation(
                          options: MutationOptions(
                            document: gql(addItemToCartMut),
                            variables: {
                              'id':
                                  cubit.productDetailsModel?.product?.id
                                      .toString(),
                            },
                            onCompleted: (data) {
                              log("item added to cart and result is $data");
                            },
                            onError: (error) {
                              log("error: $error");
                            },
                          ),
                          builder:
                              (runMutation, result) => Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: CustomAppButton(
                                  text: "Add To Cart",
                                  onPressed: () {
                                    runMutation({
                                      'id':
                                          cubit.productDetailsModel?.product?.id
                                              .toString(),
                                    });
                                  },
                                  containerColor: Colors.orange,
                                ),
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

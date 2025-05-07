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
import '../widget/custom_variation_list_view_body.dart';

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
                          cubit.productImage ??
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
                                    cubit.productName ??
                                    cubit.productDetailsModel?.product?.name ??
                                    "",
                                value:
                                    cubit.productCode ??
                                    cubit.productDetailsModel?.product?.code ??
                                    "",
                              ),
                              cubit
                                          .productDetailsModel
                                          ?.product
                                          ?.hasVariations ==
                                      true
                                  ? SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return CustomVariationListViewBody(
                                          onTap: () {
                                            log(index.toString());
                                            cubit.toggleVariationSelection(
                                              index,
                                            );
                                          },
                                          borderColor:
                                              cubit.isSelectedVariation(index)
                                                  ? Colors.orange
                                                  : Colors.grey,
                                          variationName: cubit
                                              .textSepereatedFunction(
                                                cubit
                                                        .productDetailsModel
                                                        ?.product
                                                        ?.variations?[index]
                                                        .name ??
                                                    "",
                                              ),
                                          variationPrice:
                                              cubit
                                                  .productDetailsModel
                                                  ?.product
                                                  ?.variations?[index]
                                                  .price
                                                  ?.list
                                                  ?.formattedAmount ??
                                              "0.0",
                                          index: index,
                                          cubit: cubit,
                                        );
                                      },

                                      itemCount:
                                          cubit
                                              .productDetailsModel
                                              ?.product
                                              ?.variations
                                              ?.length ??
                                          0,
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
                                child: Column(
                                  spacing: 16,
                                  children: [
                                    Visibility(
                                      visible:
                                          cubit.selectedVariations.isNotEmpty,
                                      child: CustomAppButton(
                                        height: 44,
                                        text: "Show Product Original Details",
                                        containerColor: Colors.orange,
                                        onPressed: () {
                                          cubit.clearSelection();
                                          log(
                                            "selectedVariations: ${cubit.selectedVariations}",
                                          );
                                        },
                                      ),
                                    ),
                                    CustomAppButton(
                                      height: 44,
                                      text: "Add To Cart",
                                      onPressed: () {
                                        runMutation({
                                          'id':
                                              cubit
                                                  .productDetailsModel
                                                  ?.product
                                                  ?.id
                                                  .toString(),
                                        });
                                      },
                                      containerColor: Colors.orange,
                                    ),
                                  ],
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

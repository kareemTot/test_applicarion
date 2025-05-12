import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:test_applicarion/core/cache/app_shared_pref.dart';
import 'package:test_applicarion/core/constant/constant.dart';
import 'package:test_applicarion/core/func/show_toast.dart';
import 'package:test_applicarion/core/widget/custom_app_button.dart';
import 'package:test_applicarion/di.dart';
import 'package:test_applicarion/feature/cart/presentation/widget/custom_row_text.dart';
import 'package:test_applicarion/feature/products/presentation/cubit/product_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/custom_out_of_stock_container_text.dart';
import '../widget/custom_variation_list_view_body.dart';

class ProductDetailsScren extends StatefulWidget {
  final String id;
  const ProductDetailsScren({super.key, required this.id});

  @override
  State<ProductDetailsScren> createState() => _ProductDetailsScrenState();
}

class _ProductDetailsScrenState extends State<ProductDetailsScren> {
  String? _fullfilmentCenterId;

  Future<void> load() async {
    final centerId = await SharedPref().get(fullfilmentCenterId);
    setState(() {
      _fullfilmentCenterId = centerId;
    });
    log("_fullfilmentCenterId: $_fullfilmentCenterId");
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductDetailsCubit(getIt())
                ..getProductDetails(productId: widget.id),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
          if (state is AddItemToCartSuccessState) {
            showToast(message: "Added to Cart", backgroundColor: Colors.green);
          } else if (state is AddItemToCartFailureState) {
            showToast(message: state.failure, backgroundColor: Colors.red);
          }
        },
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
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
                            Visibility(
                              visible:
                                  !cubit
                                      .productDetailsModel!
                                      .product!
                                      .availabilityData!
                                      .isInStock!,
                              child: CustomOutOfStockContainerText(
                                radius: 0,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                              CustomRowText(
                                title: "Price",
                                value:
                                    cubit.productPrice ??
                                    cubit
                                        .productDetailsModel
                                        ?.product
                                        ?.price
                                        ?.list
                                        ?.formattedAmount ??
                                    "",
                              ),

                              cubit
                                          .productDetailsModel
                                          ?.product
                                          ?.hasVariations ==
                                      true
                                  ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 8,
                                    children: [
                                      Text("Variations"),
                                      SizedBox(
                                        height: 50,
                                        child: ListView.separated(
                                          padding: EdgeInsets.zero,
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(width: 16);
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return CustomVariationListViewBody(
                                              isOutOfStock:
                                                  !cubit
                                                      .productDetailsModel!
                                                      .product!
                                                      .variations![index]
                                                      .availabilityData!
                                                      .isInStock!,
                                              onTap: () {
                                                log(index.toString());
                                                cubit.toggleVariationSelection(
                                                  index,
                                                );
                                              },
                                              borderColor:
                                                  cubit.isSelectedVariation(
                                                        index,
                                                      )
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
                                      ),
                                    ],
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
                        state is AddItemToCartLoadingState
                            ? Center(child: CircularProgressIndicator())
                            : Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 20,
                              ),
                              child: CustomAppButton(
                                height: 44,
                                text: "Add To Cart",
                                onPressed: () {
                                  !cubit
                                          .productDetailsModel!
                                          .product!
                                          .availabilityData!
                                          .isInStock!
                                      ? null
                                      : cubit.addItemToCart(
                                        productId:
                                            cubit
                                                .productDetailsModel
                                                ?.product
                                                ?.id
                                                .toString() ??
                                            "",
                                        fullfilmentCenterId:
                                            _fullfilmentCenterId,
                                      );
                                },
                                containerColor:
                                    !cubit
                                            .productDetailsModel!
                                            .product!
                                            .availabilityData!
                                            .isInStock!
                                        ? Colors.grey
                                        : Colors.orange,
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

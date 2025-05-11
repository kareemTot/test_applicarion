import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../../core/widget/custom_out_of_stock_widget.dart';
import '../../../cart/Data/service/add_item_to_cart_mut.dart';
import '../view/product_details_scren.dart';

class CustomProductListViewBody extends StatelessWidget {
  final String productId;
  final String productName;
  final String productCode;
  final int productQuntity;
  final String productImage;
  final bool isOutOfStock;

  const CustomProductListViewBody({
    super.key,
    required this.productId,
    required this.productName,
    required this.productCode,
    required this.productQuntity,
    required this.productImage,
    required this.isOutOfStock,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AbsorbPointer(
          absorbing: !isOutOfStock,
          child: Opacity(
            opacity: !isOutOfStock ? 0.5 : 1.0,
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScren(id: productId),
                  ),
                );
              },
              trailing: Mutation(
                options: MutationOptions(
                  document: gql(addItemToCartMut),
                  variables: {'id': productId},
                  onCompleted: (data) {
                    log("item added to cart and result is $data");
                  },
                  onError: (error) {
                    log("error: $error");
                  },
                ),
                builder:
                    (runMutation, result) => GestureDetector(
                      onTap:
                          !isOutOfStock
                              ? null
                              : () {
                                log(productId);
                                log("$runMutation");
                                log("result: $result");
                                runMutation({'id': productId});
                              },
                      child:
                          result!.isLoading
                              ? const CircularProgressIndicator()
                              : Icon(
                                Icons.shopping_cart,
                                color:
                                    !isOutOfStock ? Colors.grey : Colors.orange,
                              ),
                    ),
              ),
              title: Text(productName),
              subtitle: Row(
                children: [
                  Text(productCode),
                  const SizedBox(width: 6),
                  Text("Quantity $productQuntity"),
                ],
              ),
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Image.network(productImage, height: 80, width: 80),
              ),
            ),
          ),
        ),

        if (!isOutOfStock) CustomOutOfStockWidget(),
      ],
    );
  }
}

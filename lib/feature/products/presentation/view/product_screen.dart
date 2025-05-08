import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../../core/constant/constant.dart';
import '../../Data/service/product_ql.dart';
import '../widget/custom_product_list_view_body.dart';

class ProductScreen extends StatefulWidget {
  final String category;
  final String categoryName;
  const ProductScreen({
    super.key,
    required this.category,
    required this.categoryName,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic> loadedProducts = [];
  int? totalCount;
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;

  @override
  void initState() {
    log("Category ID: ${widget.category}");
    log("Category Name: ${widget.categoryName}");
    log("Products: ${loadedProducts.length}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products Screen')),
      body: Query(
        options: QueryOptions(
          document: gql(productQl),
          variables: {
            'first': 15,
            'after': null,
            'filter':
                "category.subtree:0a841b7e-c732-4738-913d-9e43c054170e/${widget.category}",
          },
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading && loadedProducts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (result.hasException) {
            log(result.exception.toString());
            return Center(child: Text(result.exception.toString()));
          }
          if (result.data != null) {
            final newProducts = result.data?['products']?['items'] ?? 0;
            if (newProducts.isNotEmpty) {
              final products =
                  newProducts
                      .where(
                        (product) =>
                            !loadedProducts.any(
                              (item) => item['id'] == product['id'],
                            ),
                      )
                      .toList();
              loadedProducts.addAll(products);
              totalCount = result.data?['products']?['totalCount'];
            }
          }
          final pageInfo = result.data?['products']?['pageInfo'];
          final hasNextPage = pageInfo?['hasNextPage'] ?? false;
          final endCursor = pageInfo?['endCursor'];

          return Column(
            children: [
              Text('Products count: $totalCount'),
              Text('Products loaded: ${loadedProducts.length}'),
              Expanded(
                child: NotificationListener(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (!isLoadingMore &&
                        hasNextPage &&
                        scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                      setState(() {
                        isLoadingMore = true;
                      });
                      fetchMore!(
                            FetchMoreOptions(
                              variables: {
                                'first': 5,
                                'after': endCursor,
                                'filter':
                                    "category.subtree:0a841b7e-c732-4738-913d-9e43c054170e/${widget.category}",
                              },
                              updateQuery: (
                                previousResultData,
                                fetchMoreResultData,
                              ) {
                                final List<dynamic> newItems = [
                                  ...previousResultData?['products']?['items'] ??
                                      [],
                                  ...fetchMoreResultData?['products']?['items'] ??
                                      [],
                                ];
                                fetchMoreResultData?['products']?['items'] =
                                    newItems;
                                return fetchMoreResultData;
                              },
                            ),
                          )
                          .then((_) {
                            setState(() {
                              isLoadingMore = false;
                            });
                          });
                    }
                    return false;
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: loadedProducts.length + (hasNextPage ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < loadedProducts.length) {
                        return CustomProductListViewBody(
                          productId: loadedProducts[index]['id'].toString(),
                          productName: loadedProducts[index]['name'].toString(),
                          productCode: loadedProducts[index]['code'],
                          productQuntity: loadedProducts[index]['maxQuantity'],
                          productImage:
                              (loadedProducts[index]['images'] != null &&
                                      loadedProducts[index]['images']
                                          .isNotEmpty)
                                  ? loadedProducts[index]['images'][0]['url']
                                  : image,
                          isOutOfStock:
                              loadedProducts[index]['availabilityData']['isInStock'],
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child:
                                isLoadingMore
                                    ? const CircularProgressIndicator()
                                    : Container(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

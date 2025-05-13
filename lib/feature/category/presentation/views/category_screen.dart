import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../service/category_ql.dart';
import '../widget/custom_category_list_view_body_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<dynamic> loadedCategories = [];
  int? totalCount;
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alkhbaz Store Statistics'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Query(
        options: QueryOptions(
          document: gql(getStoreData),
          variables: {'first': 20, 'after': null},
        ),
        builder: (
          QueryResult result, {
          VoidCallback? refetch,
          FetchMore? fetchMore,
        }) {
          if (result.isLoading && loadedCategories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (result.hasException) {
            log("===========================${result.hasException}");
            log("===========================${result.exception.toString()}");

            return Center(
              child: Text(
                'Error loading data: ${result.exception.toString()}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (result.data != null) {
            final newCategories = result.data?['categories']?['items'] ?? [];
            if (newCategories.isNotEmpty) {
              // ! this line Prevents duplicate data
              final newItems =
                  newCategories
                      .where(
                        (newItem) =>
                            !loadedCategories.any(
                              (existingItem) =>
                                  existingItem['id'] == newItem['id'],
                            ),
                      )
                      .toList();

              loadedCategories.addAll(newItems);
              totalCount = result.data?['categories']?['totalCount'];
            }
          }

          final pageInfo = result.data?['categories']?['pageInfo'];
          final hasNextPage = pageInfo?['hasNextPage'] ?? false;
          final endCursor = pageInfo?['endCursor'];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                Text("Category Counter ${totalCount ?? 'Loading...'}"),
                Text("Category Loaded ${loadedCategories.length}"),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
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
                                variables: {'first': 5, 'after': endCursor},
                                updateQuery: (
                                  previousResultData,
                                  fetchMoreResultData,
                                ) {
                                  final List<dynamic> newItems = [
                                    ...previousResultData?['categories']?['items'] ??
                                        [],
                                    ...fetchMoreResultData?['categories']?['items'] ??
                                        [],
                                  ];
                                  fetchMoreResultData?['categories']?['items'] =
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
                      itemCount:
                          loadedCategories.length + (hasNextPage ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < loadedCategories.length) {
                          return CustomCategoryListViewBodyItem(
                            image:
                                (loadedCategories[index]['images'] != null &&
                                        loadedCategories[index]['images']
                                            .isNotEmpty)
                                    ? loadedCategories[index]['images'][0]['url']
                                    : loadedCategories[0]['images'][0]['url'],
                            categoryId: loadedCategories[index]['id'],
                            categoryName: loadedCategories[index]['name'],
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
            ),
          );
        },
      ),
    );
  }
}

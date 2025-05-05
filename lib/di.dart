import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/feature/products/Data/source/base/products_source.dart';

import 'core/constant/constant.dart';
import 'feature/products/Data/repo/products_repo_impl.dart';
import 'feature/products/Data/source/implement/products_source_implement.dart';
import 'feature/products/domin/repo/products_repo.dart';
import 'feature/products/presentation/cubit/product_details_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencyInjection() async {
  await _registerSingletons();
  _registerDataSources();
  _registerRepos();
  _registerFactory();
}

Future<void> _registerSingletons() async {
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
    () => GlobalKey<NavigatorState>(),
  );
  final client = GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink(
      baseUrl,
      defaultHeaders: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    ),
  );
  getIt.registerLazySingleton<GraphQLClient>(() => client);
}

void _registerDataSources() {
  getIt.registerSingleton<ProductsSource>(ProductsSourceImplement(getIt()));
}

void _registerRepos() {
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(getIt()));
}

void _registerFactory() {
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(getIt()),
  );
}

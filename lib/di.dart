import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/feature/cart/Data/repo/cart_repo_impl.dart';
import 'package:test_applicarion/feature/cart/Data/source/base/cart_source.dart';
import 'package:test_applicarion/feature/cart/Data/source/impl/cart_source_implement.dart';
import 'package:test_applicarion/feature/cart/domain/repo/cart_repo.dart';
import 'package:test_applicarion/feature/cart/presentation/cubit/cart_cubit.dart';
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
  getIt.registerSingleton<CartSource>(CartSourceImplement(getIt()));
}

void _registerRepos() {
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(getIt()));
  getIt.registerSingleton<CartRepo>(CartRepoImpl(getIt()));
}

void _registerFactory() {
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(getIt()),
  );
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
}

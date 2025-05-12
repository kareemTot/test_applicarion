import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_applicarion/feature/cart/Data/repo/cart_repo_impl.dart';
import 'package:test_applicarion/feature/cart/Data/source/base/cart_source.dart';
import 'package:test_applicarion/feature/cart/Data/source/impl/cart_source_implement.dart';
import 'package:test_applicarion/feature/cart/domain/repo/cart_repo.dart';
import 'package:test_applicarion/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:test_applicarion/feature/fullfilment_center/data/repo/fullfilment_center_repo_impelement.dart';
import 'package:test_applicarion/feature/fullfilment_center/data/source/base/fullfilment_center_source.dart';
import 'package:test_applicarion/feature/fullfilment_center/data/source/implement/fullfilment_center_source_implement.dart';
import 'package:test_applicarion/feature/fullfilment_center/domain/repo/fullfilment_center_repo.dart';
import 'package:test_applicarion/feature/fullfilment_center/presentation/cubit/fullfilment_center_cubit.dart';
import 'package:test_applicarion/feature/products/Data/source/base/products_source.dart';
import 'core/cache/app_shared_pref.dart';
import 'core/constant/constant.dart';
import 'core/network/dio/base_dio.dart';
import 'core/network/dio/dio_client.dart';
import 'core/network/dio/dio_interceptor.dart';
import 'feature/login/data/repo/login_repo_impl.dart';
import 'feature/login/data/source/base/login_source.dart';
import 'feature/login/data/source/implement/login_source_impl.dart';
import 'feature/login/domain/login_repo.dart';
import 'feature/login/presentation/cubit/login_cubit.dart';
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
  final token = await SharedPref().get(tokenValue);
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
    () => GlobalKey<NavigatorState>(),
  );
  BaseOptions options = BaseOptions(
    validateStatus: (status) {
      return status != null && status < 500;
    },
    baseUrl: url,
    followRedirects: false,
    headers: {'Content-Type': 'application/json'},
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
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
  getIt.registerSingleton<BaseDio>(
    DioClient(options: options, dio: Dio(), interceptors: [DioInterceptor()]),
  );
  getIt.registerLazySingleton<GraphQLClient>(() => client);
}

void _registerDataSources() {
  getIt.registerSingleton<ProductsSource>(ProductsSourceImplement(getIt()));
  getIt.registerSingleton<CartSource>(CartSourceImplement(getIt()));
  getIt.registerSingleton<LoginSource>(LoginSourceImpl(getIt()));
  getIt.registerSingleton<FullfilmentCenterSource>(
    FullfilmentCenterSourceImplement(getIt()),
  );
}

void _registerRepos() {
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(getIt()));
  getIt.registerSingleton<CartRepo>(CartRepoImpl(getIt()));
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl(getIt()));
  getIt.registerSingleton<FullfilmentCenterRepo>(
    FullfilmentCenterRepoImpelement(getIt()),
  );
}

void _registerFactory() {
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(getIt()),
  );
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<FullfilmentCenterCubit>(
    () => FullfilmentCenterCubit(getIt()),
  );
}

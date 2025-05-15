import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'core/cache/app_shared_pref.dart';
import 'core/constant/constant.dart';
import 'core/network/dio.dart';
import 'feature/cart/Data/Data.dart';
import 'feature/cart/domain/repo/repo.dart';
import 'feature/cart/presentation/cubit/cart_cubit.dart';
import 'feature/fullfilment_center/data/data.dart';
import 'feature/fullfilment_center/domain/repo/repo.dart';
import 'feature/fullfilment_center/presentation/cubit/fullfilment_center_cubit.dart';
import 'feature/login/data/data.dart';
import 'feature/login/domain/domain.dart';
import 'feature/login/presentation/cubit/login_cubit.dart';
import 'feature/products/Data/data.dart';
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
    baseUrl: baseUrlTest,
    followRedirects: false,
    headers: {'Content-Type': 'application/json'},
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );
  final client = GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink(
      graphQlUrl,
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
  getIt.registerSingleton<CartSource>(CartSourceImplement(getIt(), getIt()));
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

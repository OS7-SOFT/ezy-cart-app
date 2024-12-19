import 'package:dio/dio.dart';
import 'package:ezy_cart_app/core/network/network_info.dart';
import 'package:ezy_cart_app/features/product/data/data_sources/product_local_data_source.dart';
import 'package:ezy_cart_app/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:ezy_cart_app/features/product/data/repositories_impl/product_repository_impl.dart';
import 'package:ezy_cart_app/features/product/domain/repositories/product_repository.dart';
import 'package:ezy_cart_app/features/product/domain/use_cases/get_all_products.dart';
import 'package:ezy_cart_app/features/product/domain/use_cases/get_product_by_id.dart';
import 'package:ezy_cart_app/features/product/domain/use_cases/get_products_by_category.dart';
import 'package:ezy_cart_app/features/product/presentation/cubit/product_cubit.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt()));

  getIt.registerFactory(() => ProductCubit(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(() => GetAllProducts(repository: getIt()));
  getIt.registerLazySingleton(() => GetProductById(repository: getIt()));
  getIt.registerLazySingleton(() => GetProductsByCategory(repository: getIt()));

  getIt.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(dio: Dio()));
  getIt.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(sharedPreferences: getIt()));
}

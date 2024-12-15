import 'package:dio/dio.dart';
import 'package:ezy_cart_app/core/network/network_info.dart';
import 'package:ezy_cart_app/features/category/data/data_sources/category_local_data_source.dart';
import 'package:ezy_cart_app/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:ezy_cart_app/features/category/data/repositories_impl/category_repositroy_impl.dart';
import 'package:ezy_cart_app/features/category/domain/repositories/category_repository.dart';
import 'package:ezy_cart_app/features/category/domain/use_cases/category_use_case.dart';
import 'package:ezy_cart_app/features/category/presentation/cubit/category_cubit.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  getIt.registerLazySingleton<CategoryRepository>(() => CategoryRepositroyImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt()));

  getIt.registerFactory(() => CategoryCubit(getIt()));
  getIt.registerLazySingleton(() => GetAllCategories(repository: getIt()));
  getIt.registerLazySingleton(() => AddCategory(repository: getIt()));
  getIt.registerLazySingleton(() => UpdateCategory(repository: getIt()));
  getIt.registerLazySingleton(() => DeleteCategory(repository: getIt()));

  getIt.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(dio: Dio()));
  getIt.registerLazySingleton<CategoryLocalDataSource>(
      () => CategoryLocalDataSourceImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  getIt.registerLazySingleton(() => InternetConnectionChecker.createInstance());
}

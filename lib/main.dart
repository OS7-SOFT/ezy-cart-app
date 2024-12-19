import 'package:ezy_cart_app/core/utils/app_router.dart';
import 'package:ezy_cart_app/features/category/domain/use_cases/category_use_case.dart';
import 'package:ezy_cart_app/features/category/presentation/cubit/category_cubit.dart';
import 'package:ezy_cart_app/features/product/domain/use_cases/get_all_products.dart';
import 'package:ezy_cart_app/features/product/domain/use_cases/get_product_by_id.dart';
import 'package:ezy_cart_app/features/product/domain/use_cases/get_products_by_category.dart';
import 'package:ezy_cart_app/features/product/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ezy_cart_app/features/category/dependency_injection_.dart'
    as category_di;
import 'package:ezy_cart_app/features/product/dependency_injection.dart'
    as product_di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await category_di.setupDependencyInjection();
  await product_di.setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => category_di.getIt<CategoryCubit>(),
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
            highlightColor: const Color.fromARGB(255, 248, 248, 248),
            primaryColorLight: const Color.fromRGBO(248, 55, 88, 100)),
      ),
    );
  }
}

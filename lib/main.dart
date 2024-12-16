import 'package:ezy_cart_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:ezy_cart_app/features/category/dependency_injection_.dart'
    as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme:
          ThemeData(primaryColorLight: const Color.fromRGBO(248, 55, 88, 100)),
    );
  }
}

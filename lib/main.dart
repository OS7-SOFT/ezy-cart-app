import 'package:ezy_cart_app/features/category/domain/use_cases/category_use_case.dart';
import 'package:ezy_cart_app/features/category/presentation/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ezy_cart_app/features/category/dependency_injection_.dart'
    as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => di.getIt<CategoryCubit>()..fetchAllProduct(),
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('CAtegorys')),
            body: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategorySuccess) {
                  return ListView.builder(
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      final category = state.categories[index];
                      return ListTile(
                        title: Text(category.name),
                      );
                    },
                  );
                } else if (state is CategoryError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text('No CAtegorys Available'));
                }
              },
            ),
          ),
        ));
  }
}

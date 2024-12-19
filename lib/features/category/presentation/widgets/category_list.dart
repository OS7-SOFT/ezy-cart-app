import 'package:ezy_cart_app/features/category/presentation/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:ezy_cart_app/features/category/presentation/cubit/category_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.only(left: 16, top: 10, bottom: 16),
      width: double.infinity,
      height: 100,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: Text("Loading..."),
            );
          } else if (state is CategorySuccess) {
            var categories = state.categories;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryButton(
                  category: categories[index],
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

import 'package:ezy_cart_app/core/widgets/app_bar.dart';
import 'package:ezy_cart_app/core/widgets/filter_button.dart';
import 'package:ezy_cart_app/core/widgets/search_field_widget.dart';
import 'package:ezy_cart_app/features/product/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezy_cart_app/features/category/dependency_injection_.dart'
    as di;

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: AppBarHelper.buildAppBar(context),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocProvider(
          create: (context) => di.getIt<ProductCubit>(),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const CircularProgressIndicator();
              } else if (state is ProductSuccess) {
                return Column(
                  children: [
                    const SearchFieldWidget(),
                    Row(
                      children: [
                        Text("${state.products.length} Items"),
                        const Spacer(),
                        FilterButton(
                          icon: Icons.sort,
                          title: "Sort",
                          onTap: () {},
                        ),
                        FilterButton(
                          icon: Icons.filter,
                          title: "Filter",
                          onTap: () {},
                        ),
                      ],
                    )
                  ],
                );
              } else if (state is ProductError) {
                return Center(child: Text(state.message));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

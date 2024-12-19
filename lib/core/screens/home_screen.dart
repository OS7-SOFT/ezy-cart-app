import 'package:carousel_slider/carousel_slider.dart';
import 'package:ezy_cart_app/core/widgets/app_bar.dart';
import 'package:ezy_cart_app/core/widgets/filter_button.dart';
import 'package:ezy_cart_app/core/widgets/search_field_widget.dart';
import 'package:ezy_cart_app/features/category/presentation/widgets/category_list.dart';
import 'package:ezy_cart_app/features/product/presentation/cubit/product_cubit.dart';
import 'package:ezy_cart_app/features/product/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezy_cart_app/features/category/dependency_injection_.dart'
    as di;

import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // final getIt = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: AppBarHelper.buildAppBar(context),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SearchFieldWidget(),
            ),
            buildFilterRow(),
            const CategoryListWidget(),
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
              ),
              items:
                  ["Rectangle 48.png", "image 10.png", "image 12.png"].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/$i")),
                        ));
                  },
                );
              }).toList(),
            ),
            buildTrendingProduct(context),
            buildTrendingList(),
            buildAdsWidget(context)
          ],
        ),
      ),
    );
  }

  Container buildAdsWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color.fromARGB(255, 234, 234, 234),
          image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage("assets/images/Rectangle 55.png"))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                const Text("Flat and Heels"),
                const Text("Stand a chance to get rewarded"),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        textStyle: const WidgetStatePropertyAll(TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700)),
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).primaryColorLight)),
                    onPressed: () => context.go('/product'),
                    child: const Text("Visit Now"))
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox buildTrendingList() {
    return SizedBox(
      height: 280,
      child: BlocProvider(
        create: (context) => di.getIt<ProductCubit>()..fetchAllProducts(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: Text(
                  "Loading",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              );
            }
            if (state is ProductSuccess) {
              var products = state.products;

              return ListView.builder(
                padding: const EdgeInsets.only(left: 16),
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ProductCardWidget(product: products[index]),
                  );
                },
              );
            }
            return const Center(
              child: Text("No there any trending"),
            );
          },
        ),
      ),
    );
  }

  Container buildTrendingProduct(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(67, 146, 249, 1),
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Trending Product",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      height: 2.3),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Last Date 25/02/25 ",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: const ButtonStyle(
                shadowColor: WidgetStatePropertyAll(Colors.transparent),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                backgroundColor: WidgetStatePropertyAll(Colors.transparent)),
            onPressed: () => context.go('/product'),
            child: const Text(
              "View All",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Padding buildFilterRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Text(
            "All Features",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
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
      ),
    );
  }
}

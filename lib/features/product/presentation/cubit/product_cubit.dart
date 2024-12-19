import 'package:equatable/equatable.dart';
import 'package:ezy_cart_app/features/product/domain/entities/product_entity.dart';
import 'package:ezy_cart_app/features/product/domain/use_cases/get_all_products.dart';
import 'package:ezy_cart_app/features/product/domain/use_cases/get_product_by_id.dart';
import 'package:ezy_cart_app/features/product/domain/use_cases/get_products_by_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetAllProducts getAllProducts;
  final GetProductById getProductById;
  final GetProductsByCategory getProductsByCategory;

  ProductCubit(
      this.getAllProducts, this.getProductById, this.getProductsByCategory)
      : super(ProductInitial());

  Future<void> fetchAllProducts() async {
    emit(ProductLoading());
    final result = await getAllProducts();
    result.fold(
        (failure) => emit(ProductError(message: failure.getMessage)),
        (List<ProductEntity> products) =>
            emit(ProductSuccess(products: products)));
  }

  Future<void> fetchProductsById(int id) async {
    emit(ProductByIdLoading());
    final result = await getProductById(id);
    result.fold(
        (failure) => emit(ProductByIdError(message: failure.getMessage)),
        (product) => emit(ProductByIdSuccess(product: product)));
  }

  Future<void> fetchProductsByCategory(int id) async {
    emit(ProductByCategoryLoading());
    final result = await getProductsByCategory(id);
    result.fold(
        (failure) => emit(ProductByCategroyError(message: failure.getMessage)),
        (products) => emit(ProductByCategorySuccess(products: products)));
  }
}

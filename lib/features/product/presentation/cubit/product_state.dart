part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductEntity> products;

  const ProductSuccess({required this.products});
}

final class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});
}

final class ProductByIdLoading extends ProductState {}

final class ProductByIdSuccess extends ProductState {
  final ProductEntity product;

  const ProductByIdSuccess({required this.product});
}

final class ProductByIdError extends ProductState {
  final String message;

  const ProductByIdError({required this.message});
}

final class ProductByCategoryLoading extends ProductState {}

final class ProductByCategorySuccess extends ProductState {
  final List<ProductEntity> products;

  const ProductByCategorySuccess({required this.products});
}

final class ProductByCategroyError extends ProductState {
  final String message;

  const ProductByCategroyError({required this.message});
}

final class ProductActionLoading extends ProductState {}

final class ProductActionSuccess extends ProductState {}

final class ProductActionError extends ProductState {}

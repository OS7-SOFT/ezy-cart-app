part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryEntity> categories;

  const CategorySuccess({required this.categories});
}

final class CategoryError extends CategoryState {
  final String message;

  const CategoryError({required this.message});
}

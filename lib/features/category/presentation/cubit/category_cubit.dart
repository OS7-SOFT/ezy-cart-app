import 'package:equatable/equatable.dart';
import 'package:ezy_cart_app/features/category/domain/entities/category_entity.dart';
import 'package:ezy_cart_app/features/category/domain/use_cases/category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetAllCategories getAllCategories;
  CategoryCubit(this.getAllCategories) : super(CategoryInitial()) {
    fetchAllCategroy();
  }

  Future<void> fetchAllCategroy() async {
    emit(CategoryLoading());
    final result = await getAllCategories();
    result.fold(
        (failure) => emit(CategoryError(message: failure.getMessage)),
        (List<CategoryEntity> categories) =>
            emit(CategorySuccess(categories: categories)));
  }
}

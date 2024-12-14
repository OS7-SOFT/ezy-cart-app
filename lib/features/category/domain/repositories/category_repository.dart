import 'package:dartz/dartz.dart';
import 'package:ezy_cart_app/core/errors/failures.dart';
import 'package:ezy_cart_app/features/category/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, CategoryEntity>> getCategoryById(int id);
  Future<Either<Failure, Unit>> addCategory(CategoryEntity category);
  Future<Either<Failure, Unit>> updateCategory(int id, CategoryEntity category);
  Future<Either<Failure, Unit>> deleteCategory(int id);
}

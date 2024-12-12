import 'package:dartz/dartz.dart';
import 'package:ezy_cart_app/core/errors/failures.dart';
import 'package:flutter/foundation.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, Category>> getCategoryById(int id);
  Future<Either<Failure, Category>> addCategory(Category category);
  Future<Either<Failure, Category>> updateCategory(int id, Category category);
  Future<Either<Failure, Category>> deleteCategory(int id);
}

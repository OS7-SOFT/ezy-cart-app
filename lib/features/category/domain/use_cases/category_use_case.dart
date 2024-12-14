import 'package:dartz/dartz.dart';
import 'package:ezy_cart_app/core/errors/failures.dart';
import 'package:ezy_cart_app/features/category/domain/entities/category_entity.dart';
import 'package:ezy_cart_app/features/category/domain/repositories/category_repository.dart';

class GetAllCategories {
  final CategoryRepository repository;

  GetAllCategories(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await repository.getAllCategories();
  }
}

class GetCategoryById {
  final CategoryRepository repository;

  GetCategoryById(this.repository);

  Future<Either<Failure, CategoryEntity>> call(int id) async {
    return await repository.getCategoryById(id);
  }
}

class AddCategory {
  final CategoryRepository repository;

  AddCategory(this.repository);

  Future<Either<Failure, Unit>> call(CategoryEntity category) async {
    return await repository.addCategory(category);
  }
}

class UpdateCategory {
  final CategoryRepository repository;

  UpdateCategory(this.repository);

  Future<Either<Failure, Unit>> call(int id, CategoryEntity category) async {
    return await repository.updateCategory(id, category);
  }
}

class DeleteCategory {
  final CategoryRepository repository;

  DeleteCategory(this.repository);

  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.deleteCategory(id);
  }
}

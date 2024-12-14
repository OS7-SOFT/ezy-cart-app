import 'package:dartz/dartz.dart';
import 'package:ezy_cart_app/core/errors/exceptions.dart';
import 'package:ezy_cart_app/core/errors/failures.dart';
import 'package:ezy_cart_app/core/network/network_info.dart';
import 'package:ezy_cart_app/features/category/data/data_sources/category_local_data_source.dart';
import 'package:ezy_cart_app/features/category/data/data_sources/category_remote_data_source.dart';
import 'package:ezy_cart_app/features/category/data/models/category_model.dart';
import 'package:ezy_cart_app/features/category/domain/entities/category_entity.dart';
import 'package:ezy_cart_app/features/category/domain/repositories/category_repository.dart';

class CategoryRepositroyImpl extends CategoryRepository {
  final NetworkInfo networkInfo;
  final CategoryLocalDataSource localDataSource;
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositroyImpl(
      {required this.networkInfo,
      required this.localDataSource,
      required this.remoteDataSource});

  @override
  Future<Either<Failure, Unit>> addCategory(CategoryEntity category) async {
    final newCategory = CategoryModel(
        id: category.id, name: category.name, imageUrl: category.imageUrl);
    return await getResponce(() => remoteDataSource.addCategory(newCategory));
  }

  @override
  Future<Either<Failure, Unit>> deleteCategory(int id) async {
    return await getResponce(() => remoteDataSource.deleteCategory(id));
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    if (await networkInfo.isConnection) {
      try {
        final remoteData = await remoteDataSource.getAllCategories();
        localDataSource.cachedCategories(remoteData);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure(message: "Opps there are some error"));
      }
    } else {
      try {
        final localData = await localDataSource.getCachedCategories();
        return Right(localData);
      } on EmptyCachedException {
        return Left(EmptyCacheFailure(
            message: "Opps No there any Data in local try to get from server"));
      }
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(int id) async {
    if (await networkInfo.isConnection) {
      try {
        final category = await remoteDataSource.getCategoryById(id);
        return Right(category);
      } on ServerException {
        return Left(ServerFailure(message: "Opps there are some error"));
      }
    } else {
      return Left(
          NetworkFailure(message: "No there any Connection by internet"));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCategory(
      int id, CategoryEntity category) async {
    final updateCategory = CategoryModel(
        id: category.id, name: category.name, imageUrl: category.imageUrl);
    return getResponce(
        () => remoteDataSource.updateCategory(id, updateCategory));
  }

  Future<Either<Failure, Unit>> getResponce(
      Future<Unit> Function() handleCategory) async {
    if (await networkInfo.isConnection) {
      try {
        await handleCategory();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure(message: "Opps there are some error"));
      }
    } else {
      return Left(NetworkFailure(message: "Opps No there any internet"));
    }
  }
}

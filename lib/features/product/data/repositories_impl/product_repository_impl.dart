import 'package:dartz/dartz.dart';
import 'package:ezy_cart_app/core/errors/exceptions.dart';
import 'package:ezy_cart_app/core/errors/failures.dart';
import 'package:ezy_cart_app/core/network/network_info.dart';
import 'package:ezy_cart_app/features/product/data/data_sources/product_local_data_source.dart';
import 'package:ezy_cart_app/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:ezy_cart_app/features/product/data/models/product_model.dart';
import 'package:ezy_cart_app/features/product/domain/entities/product_entity.dart';
import 'package:ezy_cart_app/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final NetworkInfo networkInfo;
  final ProductLocalDataSource localDataSource;
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Unit>> addProduct(ProductEntity product) async {
    final newProduct = ProductModel.fromEntity(product);
    return await _getResponse(() => remoteDataSource.addProduct(newProduct));
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(int id) async {
    return await _getResponse(() => remoteDataSource.deleteProduct(id));
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    if (await networkInfo.isConnection) {
      try {
        final remoteData = await remoteDataSource.getAllProducts();
        localDataSource.cacheProducts(remoteData);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure(message: "Failed to fetch products."));
      }
    } else {
      try {
        final localData = await localDataSource.getCachedProducts();
        return Right(localData);
      } on EmptyCachedException {
        return Left(
          EmptyCacheFailure(message: "No cached products available."),
        );
      }
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id) async {
    if (await networkInfo.isConnection) {
      try {
        final product = await remoteDataSource.getProductById(id);
        return Right(product);
      } on ServerException {
        return Left(ServerFailure(message: "Failed to fetch product."));
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection."));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateProduct(
      int id, ProductEntity product) async {
    final updatedProduct = ProductModel.fromEntity(product);
    return await _getResponse(
        () => remoteDataSource.updateProduct(id, updatedProduct));
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      int categoryId) async {
    if (await networkInfo.isConnection) {
      try {
        final remoteData =
            await remoteDataSource.getProductsByCategory(categoryId);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure(message: "Failed to fetch products."));
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection."));
    }
  }

  Future<Either<Failure, Unit>> _getResponse(
      Future<Unit> Function() action) async {
    if (await networkInfo.isConnection) {
      try {
        await action();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure(message: "Operation failed on server."));
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection."));
    }
  }
}

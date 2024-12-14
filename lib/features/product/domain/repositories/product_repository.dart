import 'package:dartz/dartz.dart';
import 'package:ezy_cart_app/core/errors/failures.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, ProductEntity>> getProductById(int id);
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      int categoryId);
  Future<Either<Failure, Unit>> addProduct(ProductEntity product);
  Future<Either<Failure, Unit>> deleteProduct(int id);
  Future<Either<Failure, Unit>> updateProduct(int id, ProductEntity product);
}

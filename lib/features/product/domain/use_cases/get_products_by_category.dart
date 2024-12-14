import 'package:dartz/dartz.dart';
import 'package:ezy_cart_app/core/errors/failures.dart';
import 'package:ezy_cart_app/features/product/domain/repositories/product_repository.dart';
import '../entities/product_entity.dart';

class GetProductsByCategory {
  final ProductRepository repository;

  GetProductsByCategory(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call(int id) async {
    return await repository.getProductsByCategory(id);
  }
}

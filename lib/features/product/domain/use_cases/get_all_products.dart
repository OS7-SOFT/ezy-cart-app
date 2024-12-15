import 'package:dartz/dartz.dart';
import 'package:ezy_cart_app/core/errors/failures.dart';
import 'package:ezy_cart_app/features/product/domain/repositories/product_repository.dart';
import '../entities/product_entity.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts({required this.repository});

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await repository.getAllProducts();
  }
}

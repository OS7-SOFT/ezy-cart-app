import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ezy_cart_app/core/constants/constants.dart';
import 'package:ezy_cart_app/core/errors/exceptions.dart';
import 'package:ezy_cart_app/features/product/data/models/product_model.dart';

/// تعريف واجهة ProductRemoteDataSource
abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductById(int id);
  Future<Unit> addProduct(ProductModel product);
  Future<Unit> updateProduct(int id, ProductModel product);
  Future<Unit> deleteProduct(int id);
  Future<List<ProductModel>> getProductsByCategory(int categoryId);
}

/// تنفيذ ProductRemoteDataSource باستخدام Dio
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    const url = "$baseUrl/products";
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final items = response.data as List;
      return items
          .map<ProductModel>((jsonData) => ProductModel.fromJson(jsonData))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    var url = "$baseUrl/products/$id";
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addProduct(ProductModel product) async {
    var url = "$baseUrl/products";
    final response = await dio.post(url, data: product.toJson());
    return _getResponse(response.statusCode);
  }

  @override
  Future<Unit> deleteProduct(int id) async {
    var url = "$baseUrl/products/$id";
    final response = await dio.delete(url);
    return _getResponse(response.statusCode);
  }

  @override
  Future<Unit> updateProduct(int id, ProductModel product) async {
    var url = "$baseUrl/products/$id";
    final response = await dio.put(url, data: product.toJson());
    return _getResponse(response.statusCode);
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    var url = "$baseUrl/products?category=$categoryId";
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final items = response.data as List;
      return items
          .map<ProductModel>((jsonData) => ProductModel.fromJson(jsonData))
          .toList();
    } else {
      throw ServerException();
    }
  }

  Future<Unit> _getResponse(dynamic statusCode) {
    if (statusCode == 200 || statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}

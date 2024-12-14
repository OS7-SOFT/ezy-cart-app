import 'package:dartz/dartz.dart';
import 'package:ezy_cart_app/core/constants/constants.dart';
import 'package:ezy_cart_app/core/errors/exceptions.dart';
import 'package:ezy_cart_app/features/category/data/models/category_model.dart';
import 'package:dio/dio.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<CategoryModel> getCategoryById(int id);
  Future<Unit> addCategory(CategoryModel category);
  Future<Unit> updateCategory(int id, CategoryModel category);
  Future<Unit> deleteCategory(int id);
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl({required this.dio});

  @override
  Future<Unit> addCategory(CategoryModel category) async {
    var url = "$baseUrl/categories";
    final response = await dio.post(url, data: category.toJson());
    return getResponse(response.statusCode);
  }

  @override
  Future<Unit> deleteCategory(int id) async {
    var url = "$baseUrl/categories/$id";
    final response = await dio.delete(url);
    return getResponse(response.statusCode);
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    const url = "$baseUrl/categories";
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final items = response.data as List;

      return items
          .map<CategoryModel>((jsonData) => CategoryModel.fromJson(jsonData))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CategoryModel> getCategoryById(int id) async {
    var url = "$baseUrl/categories/$id";
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      return CategoryModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateCategory(int id, CategoryModel category) async {
    var url = "$baseUrl/categories/$id";
    final response = await dio.post(url, data: category.toJson());
    return getResponse(response.statusCode);
  }

  Future<Unit> getResponse(dynamic statusCode) {
    if (statusCode == 200 || statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}

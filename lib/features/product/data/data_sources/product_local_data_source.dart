import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ezy_cart_app/core/constants/constants.dart';
import 'package:ezy_cart_app/core/errors/exceptions.dart';
import 'package:ezy_cart_app/features/product/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<Unit> cacheProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheProducts(List<ProductModel> products) async {
    final jsonData = products
        .map<Map<String, dynamic>>((product) => product.toJson())
        .toList();
    await sharedPreferences.setString(
        kCachedProductData, json.encode(jsonData));
    return Future.value(unit);
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    final jsonData = sharedPreferences.getString(kCachedProductData);

    if (jsonData != null) {
      final decodedJson = json.decode(jsonData) as List;
      final products = decodedJson
          .map<ProductModel>((jsonData) => ProductModel.fromJson(jsonData))
          .toList();
      return Future.value(products);
    } else {
      throw EmptyCachedException();
    }
  }
}

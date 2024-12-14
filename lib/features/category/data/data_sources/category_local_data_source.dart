import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ezy_cart_app/core/constants/constants.dart';
import 'package:ezy_cart_app/core/errors/exceptions.dart';
import 'package:ezy_cart_app/features/category/data/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getCachedCategories();
  Future<Unit> cachedCategories(List<CategoryModel> categories);
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final SharedPreferences sharedPreferences;

  CategoryLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachedCategories(List<CategoryModel> categories) {
    final jsonData = categories
        .map<Map<String, dynamic>>((category) => category.toJson())
        .toList();
    sharedPreferences.setString(kCachedCategoryData, json.encode(jsonData));
    return Future.value(unit);
  }

  @override
  Future<List<CategoryModel>> getCachedCategories() {
    final jsonData = sharedPreferences.getString(kCachedCategoryData);
    if (jsonData != null) {
      List decodeJson = json.decode(jsonData);
      List<CategoryModel> categories = decodeJson
          .map<CategoryModel>((jsonData) => CategoryModel.fromJson(jsonData))
          .toList();
      return Future.value(categories);
    } else {
      throw EmptyCachedException();
    }
  }
}

import 'package:ezy_cart_app/core/constants/constants.dart';
import 'package:ezy_cart_app/features/category/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json[kCategoryId],
      name: json[kCategoryName],
      imageUrl: json[kCategoryImage],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kCategoryId: id,
      kCategoryName: name,
      kCategoryImage: imageUrl,
    };
  }
}

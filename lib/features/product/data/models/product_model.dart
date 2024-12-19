import 'package:ezy_cart_app/core/constants/constants.dart';

import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.categoryName,
    required super.images,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      price: entity.price,
      description: entity.description,
      categoryName: entity.categoryName,
      images: entity.images,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[kProductId],
      title: json[kProductTitle],
      price: (json[kProductPrice] as num).toDouble(),
      description: json[kProductDescription],
      categoryName: json[kCategroy][kCategoryName],
      images:
          (json[kCategoryImage] as List?)?.map((e) => e.toString()).toList() ??
              [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kProductId: id,
      kProductTitle: title,
      kProductPrice: price,
      kProductDescription: description,
      kCategroy: {
        kCategoryName: categoryName,
      },
      kCategoryImage: images,
    };
  }
}

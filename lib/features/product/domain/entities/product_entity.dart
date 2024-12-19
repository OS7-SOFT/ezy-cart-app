import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String title;
  final double price;
  final String description;
  final String categoryName;
  final List<String>? images;

  const ProductEntity({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.categoryName,
    required this.images,
  });

  @override
  List<Object?> get props =>
      [id, title, price, description, categoryName, images];
}

import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String name;
  final String imageUrl;

  const CategoryEntity({this.id, required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [id, name, imageUrl];
}

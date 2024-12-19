import 'package:ezy_cart_app/features/category/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final CategoryEntity category;
  const CategoryButton({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(category.imageUrl),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.name)
          ],
        ),
      ),
    );
  }
}

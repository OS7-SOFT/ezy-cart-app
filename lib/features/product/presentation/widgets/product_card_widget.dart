import 'package:ezy_cart_app/features/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductEntity product;
  const ProductCardWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.images!.isNotEmpty
                  ? product.images![0]
                  : "assets/images/image 10.png",
              width: 180,
              height: 140,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                product.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                product.description,
                textAlign: TextAlign.justify,
                maxLines: 4,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    height: 1.5, color: Color.fromARGB(255, 92, 92, 92)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                "\$${product.price}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
            )
          ],
        ),
      ),
    );
  }
}

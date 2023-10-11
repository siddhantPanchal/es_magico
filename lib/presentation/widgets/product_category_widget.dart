import 'package:es_magico/models/product_category.dart';
import 'package:flutter/material.dart';

class ProductCategoryWidget extends StatelessWidget {
  const ProductCategoryWidget({super.key, required this.category});

  final ProductCategory category;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: SizedBox(
          height: 70,
          width: 130,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(category.image),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

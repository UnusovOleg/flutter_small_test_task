import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_small_test_task/common/product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final void Function(Product product) onDelete;

  const ItemCard({
    Key? key,
    required this.product,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    child: CachedNetworkImage(
                      errorWidget: (_, __, ___) => const Icon(Icons.error),
                      imageUrl: product.imageUrl,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: const Alignment(1, -1),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
            width: 32,
            height: 32,
            child: ElevatedButton(
              onPressed: () => onDelete(product),
              child: const Icon(
                Icons.delete_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:math';

import 'package:uuid/uuid.dart';
import 'package:flutter_small_test_task/common/product/dictionary/product_definition.dart';
import 'package:flutter_small_test_task/common/product/generator/generated_product.dart';
import 'package:flutter_small_test_task/common/product/dictionary/products_dictionary.dart';

class ProductGenerator {
  final Uuid _uuid = Uuid();
  final Random random = Random();
  final int _min;
  final int _max;
  final ProductsDictionary productsDictionary;

  ProductGenerator(
      {required int min,
      required int max,
      required ProductsDictionary productsDictionary})
      : this._min = min,
        this._max = max,
        this.productsDictionary = productsDictionary;

  List<GeneratedProduct> generate() {
    final int productsAmount = _min + random.nextInt(_max - _min);
    return List<GeneratedProduct>.generate(
      productsAmount,
      (_) => generateSingle(),
    );
  }

  GeneratedProduct generateSingle() {
    ProductDefinition rawProduct = productsDictionary.getAny();
    return GeneratedProduct(
        id: _uuid.v1(), title: rawProduct.title, imageUrl: rawProduct.imageUrl);
  }
}

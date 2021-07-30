import 'package:flutter_small_test_task/common/product/dictionary/products_dictionary.dart';
import 'package:flutter_small_test_task/common/product/generator/generated_product.dart';
import 'package:flutter_small_test_task/common/product/generator/product_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Кол-во сгенерированных продуктов должно входить в заданный промежуток',
      () {
    final min = 10000;
    final max = 1000000;
    final ProductsDictionary productsDictionary = ProductsDictionary();
    final ProductGenerator productGenerator = ProductGenerator(
      min: min,
      max: max,
      productsDictionary: productsDictionary,
    );

    final List<GeneratedProduct> products = productGenerator.generate();

    expect(min <= products.length && max >= products.length, true);
  });
}

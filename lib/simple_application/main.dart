import 'package:flutter/material.dart';
import 'package:flutter_small_test_task/common/product.dart';
import 'package:flutter_small_test_task/common/product/dictionary/products_dictionary.dart';
import 'package:flutter_small_test_task/common/product/generator/product_generator.dart';
import 'package:flutter_small_test_task/common/test_app_theme.dart';
import 'package:flutter_small_test_task/common/store.dart';
import 'package:flutter_small_test_task/simple_application/view/block_home_page.dart';

void main() {
  final ProductGenerator productGenerator = ProductGenerator(
      min: 10000, max: 1000000, productsDictionary: ProductsDictionary());
  final Store<Product> productStore = Store();

  for (var product in productGenerator.generate()) {
    productStore.add(product.id, product);
  }

  runApp(BlocApp(productGenerator, productStore));
}

class BlocApp extends StatelessWidget {
  final ProductGenerator _generator;
  final Store<Product> _productStore;
  BlocApp(this._generator, this._productStore);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Small Test Task',
      theme: TestAppTheme.theme,
      home: BlockHomePage(_generator, _productStore),
    );
  }
}

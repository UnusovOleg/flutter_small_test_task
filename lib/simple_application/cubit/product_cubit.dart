import 'package:bloc/bloc.dart';
import 'package:flutter_small_test_task/common/product.dart';
import 'package:flutter_small_test_task/common/product/generator/generated_product.dart';
import 'package:flutter_small_test_task/common/product/generator/product_generator.dart';
import 'package:flutter_small_test_task/common/store.dart';

class ProductCubit extends Cubit<List<Product>> {
  final ProductGenerator _generator;
  final Store<Product> _store;

  ProductCubit(this._generator, this._store) : super(_store.all());

  void addProduct() {
    GeneratedProduct product = _generator.generateSingle();
    _store.add(product.id, product);
    emit(_store.all());
  }

  void removeProduct(Product product) {
    _store.remove(product.id);
    emit(_store.all());
  }
}

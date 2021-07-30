import 'package:flutter_small_test_task/common/product.dart';
import 'package:flutter_small_test_task/common/product/generator/product_generator.dart';
import 'package:flutter_small_test_task/common/store.dart';

extension _JSONSerialization on Product {
  Map<String, dynamic> toJson() => {
        'id': this.id,
        'title': this.title,
        'imageUrl': this.imageUrl,
      };
}

class FakeServer {
  final ProductGenerator _productGenerator;
  final _store = Store<Map<String, dynamic>>();

  FakeServer(this._productGenerator) {
    for (var generatedProduct in _productGenerator.generate()) {
      _store.add(generatedProduct.id, generatedProduct.toJson());
    }
  }

  Future<List<Map<String, dynamic>>> requestProducts() {
    return Future.value(_store.all());
  }

  void addProduct() {
    final Product product = _productGenerator.generateSingle();
    _store.add(product.id, product.toJson());
  }

  void removeProduct(Map<String, dynamic> json) {
    _store.remove(json['id']);
  }
}

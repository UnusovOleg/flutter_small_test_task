import 'package:flutter_small_test_task/common/product.dart';

abstract class ProductsPresenter {
  Stream<List<Product>> products();
  void addProduct();
  void removeProduct(Product product);
  void dispose();
}

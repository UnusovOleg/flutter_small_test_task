import 'package:flutter_small_test_task/common/product.dart';

abstract class ProductsGateway {
  Future<List<Product>> retrieveProducts();
  void addProduct();
  void removeProduct(Product product);
}

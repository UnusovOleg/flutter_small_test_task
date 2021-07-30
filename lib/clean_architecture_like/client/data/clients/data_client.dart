import 'package:flutter_small_test_task/clean_architecture_like/client/data/raw/product_raw.dart';

abstract class DataClient {
  Future<List<ProductRaw>> requestProducts();
  void addProduct();
  void removeProduct(ProductRaw productRaw);
}

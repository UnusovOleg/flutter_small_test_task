import 'package:flutter_small_test_task/clean_architecture_like/client/domain/gateway/products_gateway.dart';
import 'package:flutter_small_test_task/common/product.dart';

class RetrieveProductsUseCase {
  final ProductsGateway _productsGateway;

  RetrieveProductsUseCase(this._productsGateway);

  Future<List<Product>> execute() {
    return _productsGateway.retrieveProducts();
  }
}

import 'package:flutter_small_test_task/clean_architecture_like/client/domain/gateway/products_gateway.dart';
import 'package:flutter_small_test_task/common/product.dart';

class RemoveProductUseCase {
  final ProductsGateway _productsGateway;

  RemoveProductUseCase(this._productsGateway);

  Future<void> execute(Product product) {
    return Future(() => _productsGateway.removeProduct(product));
  }
}

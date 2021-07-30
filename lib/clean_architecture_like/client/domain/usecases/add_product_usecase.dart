import 'package:flutter_small_test_task/clean_architecture_like/client/domain/gateway/products_gateway.dart';
import 'package:flutter_small_test_task/common/product.dart';

class AddProductUseCase {
  final ProductsGateway _productsGateway;

  AddProductUseCase(this._productsGateway);

  Future<void> execute() {
    return Future(_productsGateway.addProduct);
  }
}

import 'package:flutter_small_test_task/clean_architecture_like/client/data/clients/data_client.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/data/raw/product_raw.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/domain_product.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/gateway/products_gateway.dart';
import 'package:flutter_small_test_task/common/product.dart';

class DataProductsGateway implements ProductsGateway {
  final DataClient _dataClient;

  DataProductsGateway(this._dataClient);

  @override
  Future<List<Product>> retrieveProducts() async {
    return (await _dataClient.requestProducts()).map(_mapFromRaw).toList();
  }

  @override
  void addProduct() {
    _dataClient.addProduct();
  }

  @override
  void removeProduct(Product product) {
    _dataClient.removeProduct(_mapToRaw(product));
  }

  Product _mapFromRaw(ProductRaw raw) {
    return DomainProduct(id: raw.id, title: raw.title, imageUrl: raw.imageUrl);
  }

  ProductRaw _mapToRaw(Product product) {
    return ProductRaw(product.id, product.title, product.imageUrl);
  }
}

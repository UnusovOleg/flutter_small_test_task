import 'package:flutter_small_test_task/clean_architecture_like/client/data/clients/data_client.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/data/raw/product_raw.dart';
import 'package:flutter_small_test_task/clean_architecture_like/server/fake_server.dart';

class DataClientImpl implements DataClient {
  final FakeServer _fakeServer;

  DataClientImpl(this._fakeServer);

  @override
  void addProduct() {
    return _fakeServer.addProduct();
  }

  @override
  void removeProduct(ProductRaw raw) {
    _fakeServer.removeProduct(raw.toJson());
  }

  @override
  Future<List<ProductRaw>> requestProducts() async {
    final List<Map<String, dynamic>> productsJson =
        await _fakeServer.requestProducts();
    return Future.value(
        productsJson.map((json) => ProductRaw.fromJson(json)).toList());
  }
}

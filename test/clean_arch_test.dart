import 'package:flutter_small_test_task/clean_architecture_like/client/data/clients/data_client.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/data/clients/data_client_impl.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/data/gateway/data_products_gateway.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/domain_product.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/gateway/products_gateway.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/usecases/add_product_usecase.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/usecases/remove_product_usecase.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/usecases/retrieve_products_usecase.dart';
import 'package:flutter_small_test_task/clean_architecture_like/server/fake_server.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'clean_arch_test.mocks.dart';

@GenerateMocks([FakeServer])
void main() {
  final FakeServer _mockServer = MockFakeServer();
  final DataClient _client = DataClientImpl(_mockServer);
  final ProductsGateway _productsGateway = DataProductsGateway(_client);

  final RetrieveProductsUseCase retrieveProductsUseCase =
      RetrieveProductsUseCase(_productsGateway);

  final RemoveProductUseCase removeProductUseCase =
      RemoveProductUseCase(_productsGateway);

  final AddProductUseCase addProductUseCase =
      AddProductUseCase(_productsGateway);

  test('Получение продуктов', () async {
    when(_mockServer.requestProducts()).thenAnswer((_) => Future.value([
          {'id': 'someId', 'title': 'someTitle', 'imageUrl': 'someUrl'}
        ]));
    expect((await retrieveProductsUseCase.execute()).first.id, 'someId');
  });

  test('Удаление продукта', () async {
    List<Map<String, dynamic>> _list = [
      {'id': 'someId', 'title': 'someTitle', 'imageUrl': 'someUrl'},
      {'id': 'someElseId', 'title': 'someElseTitle', 'imageUrl': 'someElseUrl'},
    ];
    when(_mockServer.removeProduct(
            {'id': 'id', 'title': 'title', 'imageUrl': 'imageUrl'}))
        .thenAnswer((_) {
      _list.removeAt(0);
    });
    await removeProductUseCase
        .execute(DomainProduct(id: 'id', title: 'title', imageUrl: 'imageUrl'));
    expect(_list.length == 1 && _list.first['id'] == 'someElseId', true);
  });

  test('Добавление продукта', () async {
    List<Map<String, dynamic>> _list = [];
    when(_mockServer.addProduct()).thenAnswer((_) {
      _list.add({'id': 'someId', 'title': 'someTitle', 'imageUrl': 'someUrl'});
    });
    await addProductUseCase.execute();
    expect(_list.length == 1 && _list.first['id'] == 'someId', true);
  });
}

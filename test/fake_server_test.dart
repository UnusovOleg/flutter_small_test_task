import 'package:flutter_small_test_task/clean_architecture_like/server/fake_server.dart';
import 'package:flutter_small_test_task/common/product/dictionary/products_dictionary.dart';
import 'package:flutter_small_test_task/common/product/generator/product_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final ProductGenerator productGenerator = ProductGenerator(
      min: 10000, max: 1000000, productsDictionary: ProductsDictionary());
  final FakeServer fakeServer = FakeServer(productGenerator);

  test('Получение продуктов', () async {
    final List<Map<String, dynamic>> products =
        await fakeServer.requestProducts();
    expect(products.length > 0, true);
  });

  test('Удаление продукта', () async {
    final List<Map<String, dynamic>> products =
        await fakeServer.requestProducts();
    expect(products.length > 0, true);

    final Map<String, dynamic> product = products.first;
    fakeServer.removeProduct(product);

    final List<Map<String, dynamic>> productsAfterRemove =
        await fakeServer.requestProducts();
    expect(productsAfterRemove.contains(product), false);
  });

  test('Добавление продукта', () async {
    int countBeforeAdd = (await fakeServer.requestProducts()).length;

    fakeServer.addProduct();

    int countAfterAdd = (await fakeServer.requestProducts()).length;

    expect(countAfterAdd - countBeforeAdd, 1);
  });
}

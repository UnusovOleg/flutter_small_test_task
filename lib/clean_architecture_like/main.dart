import 'package:flutter/material.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/data/clients/data_client.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/data/clients/data_client_impl.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/data/gateway/data_products_gateway.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/gateway/products_gateway.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/usecases/add_product_usecase.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/usecases/remove_product_usecase.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/usecases/retrieve_products_usecase.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/presentation/clean_like_home_page.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/presentation/products_presenter_clean.dart';
import 'package:flutter_small_test_task/clean_architecture_like/server/fake_server.dart';
import 'package:flutter_small_test_task/common/product/dictionary/products_dictionary.dart';
import 'package:flutter_small_test_task/common/product/generator/product_generator.dart';
import 'package:flutter_small_test_task/common/test_app_theme.dart';

void main() {
  final ProductGenerator productGenerator = ProductGenerator(
      min: 10000, max: 100000, productsDictionary: ProductsDictionary());
  final FakeServer fakeServer = FakeServer(productGenerator);
  final DataClient fakeDataClient = DataClientImpl(fakeServer);
  final ProductsGateway productsGateway = DataProductsGateway(fakeDataClient);

  runApp(CleanLikeApp(
    RetrieveProductsUseCase(productsGateway),
    AddProductUseCase(productsGateway),
    RemoveProductUseCase(productsGateway),
  ));
}

class CleanLikeApp extends StatelessWidget {
  final RetrieveProductsUseCase retrieveProductsUseCase;
  final RemoveProductUseCase removeProductUseCase;
  final AddProductUseCase addProductUseCase;

  CleanLikeApp(
    this.retrieveProductsUseCase,
    this.addProductUseCase,
    this.removeProductUseCase,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Small Test Task',
      theme: TestAppTheme.theme,
      home: CleanLikeHomePage(
        ProductPresenterClean(
          retrieveProductsUseCase,
          addProductUseCase,
          removeProductUseCase,
        ),
      ),
    );
  }
}

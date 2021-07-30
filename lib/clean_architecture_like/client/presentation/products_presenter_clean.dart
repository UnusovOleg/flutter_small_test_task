import 'dart:async';

import 'package:flutter_small_test_task/clean_architecture_like/client/domain/usecases/add_product_usecase.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/usecases/remove_product_usecase.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/domain/usecases/retrieve_products_usecase.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/presentation/products_presenter.dart';
import 'package:flutter_small_test_task/common/product.dart';

class ProductPresenterClean implements ProductsPresenter {
  final RetrieveProductsUseCase retrieveProductsUseCase;
  final AddProductUseCase addProductUseCase;
  final RemoveProductUseCase removeProductUseCase;

  final StreamController<List<Product>> _productsStreamController =
      StreamController();

  ProductPresenterClean(this.retrieveProductsUseCase, this.addProductUseCase,
      this.removeProductUseCase) {
    _requestProducts();
  }

  @override
  Stream<List<Product>> products() {
    return _productsStreamController.stream;
  }

  void _requestProducts() async {
    List<Product> products = await retrieveProductsUseCase.execute();
    _productsStreamController.sink.add(products);
  }

  @override
  void addProduct() async {
    await addProductUseCase.execute();
    _requestProducts();
  }

  @override
  void removeProduct(Product product) async {
    await removeProductUseCase.execute(product);
    _requestProducts();
  }

  @override
  void dispose() {
    if (!this._productsStreamController.isClosed) {
      this._productsStreamController.close();
    }
  }
}

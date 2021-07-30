import 'package:flutter_small_test_task/common/product.dart';

class DomainProduct implements Product {
  String id;
  String title;
  String imageUrl;

  DomainProduct(
      {required this.id, required this.title, required this.imageUrl});
}

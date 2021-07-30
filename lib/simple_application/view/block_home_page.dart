import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_small_test_task/common/product.dart';
import 'package:flutter_small_test_task/common/product/generator/product_generator.dart';
import 'package:flutter_small_test_task/common/store.dart';
import 'package:flutter_small_test_task/simple_application/cubit/product_cubit.dart';
import 'package:flutter_small_test_task/simple_application/view/block_hone_view.dart';

class BlockHomePage extends StatelessWidget {
  final Store<Product> _store;
  final ProductGenerator _generator;

  BlockHomePage(this._generator, this._store);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(_generator, _store),
      child: BlocView(),
    );
  }
}

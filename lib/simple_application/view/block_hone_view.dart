import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_small_test_task/common/card_of_item.dart';
import 'package:flutter_small_test_task/common/product.dart';
import 'package:flutter_small_test_task/simple_application/cubit/product_cubit.dart';

typedef ProductList = List<Product>;

class BlocView extends StatelessWidget {
  BlocView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Меню',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    child: ElevatedButton(
                      onPressed: context.read<ProductCubit>().addProduct,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductCubit, ProductList>(
              builder: (context, state) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (BuildContext context, int i) => ItemCard(
                    product: state[i],
                    onDelete: context.read<ProductCubit>().removeProduct,
                  ),
                  itemCount: state.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

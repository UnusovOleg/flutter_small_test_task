import 'package:flutter/material.dart';
import 'package:flutter_small_test_task/clean_architecture_like/client/presentation/products_presenter.dart';
import 'package:flutter_small_test_task/common/card_of_item.dart';
import 'package:flutter_small_test_task/common/product.dart';

class CleanLikeHomePage extends StatefulWidget {
  final ProductsPresenter presenter;
  CleanLikeHomePage(this.presenter);

  @override
  _CleanLikeHomePageState createState() => _CleanLikeHomePageState();
}

class _CleanLikeHomePageState extends State<CleanLikeHomePage> {
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
                      onPressed: widget.presenter.addProduct,
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
            child: StreamBuilder<List<Product>>(
              stream: widget.presenter.products(),
              builder: (context, snapshot) {
                if (snapshot.data == null) return Container();
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (BuildContext context, int i) => ItemCard(
                    product: snapshot.data![i],
                    onDelete: widget.presenter.removeProduct,
                  ),
                  itemCount: snapshot.data!.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  dispose() {
    widget.presenter.dispose();
    super.dispose();
  }
}

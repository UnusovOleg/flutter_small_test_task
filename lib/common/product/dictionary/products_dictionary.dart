import 'dart:math';

import 'product_definition.dart';

final Random _random = Random();

class ProductsDictionary {
  final _productDefinitions = const <ProductDefinition>[
    ProductDefinition(
      title: "Гамбургер",
      imageUrl:
          "https://img3.freepng.ru/dy/8c135c59d58d1859671ef687561b2e18/L0KzQYm3U8AzN5RmiZH0aYP2gLBuTfhidZN6itlucj3pgrb1gBgubqNufeU2ZnH2hH7tjB9lNZRtfdd8ZXL4grjskr1jepZmRdRqcnLoc8bsTfhidZN6itlucj24cYqCWcdnQZM4StUBNT65QISCV8Q3P2I6SqI5MUW2RYSAU8M6NqFzf3==/kisspng-hamburger-french-fries-fast-food-cheeseburger-brea-barbecue-hamburger-5a9997f9b32c65.6039746715200153537339.png",
    ),
    ProductDefinition(
      title: "Кекс",
      imageUrl:
          "https://img3.freepng.ru/dy/ec9e32b34620a21275d7b038adfd9d58/L0KzQYm3UcI4N5dBfZH0aYP2gLBuTfN2eJRmg9c2Y3jyc7FzggRmNZRmg9c2Z3HxcbTvhb1kcJDoh95qdHWwcsP2lB5qbV5yRdVxb3PyfLL7hb1kfaFoed1ucz24cYfqWcFlPGM1TqMDMz67QIGBUcc4QWI6Sak5NkS5RoG4U8I3NqFzf3==/kisspng-cupcake-chocolate-cake-ganache-chocolate-brownie-m-chocolate-cupcakes-5a6c91d4206183.8008177915170646601326.png",
    ),
    ProductDefinition(
      title: "Картофель",
      imageUrl:
          "https://img3.freepng.ru/dy/31acfb803e2da7a14e2d399ae508c8dd/L0KzQYm3U8A2N5D7fZH0aYP2gLBuTfNidZN0fNtqLYDyhLL7j71nepZze9o2ZoLsdcS0lvVobaVmet5uLYP6dbb7TgBwfJJ5h9d8LUXkSbW3WfY4QWFnfqkCLkK1Q4q5U8UzOWY3SKQ9MUG3Q4aCUskveJ9s/kisspng-cambodia-potato-french-fries-vegetable-sweet-potatoes-5a9d09f790bf77.2239235215202411435929.png",
    ),
  ];

  ProductDefinition getAny() {
    return _productDefinitions[_random.nextInt(_productDefinitions.length)];
  }
}

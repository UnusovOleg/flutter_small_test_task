class ProductDefinition {
  final String title;
  final String imageUrl;

  const ProductDefinition({required this.title, required this.imageUrl});

  @override
  String toString() {
    return 'ProductDefinition: $title';
  }
}
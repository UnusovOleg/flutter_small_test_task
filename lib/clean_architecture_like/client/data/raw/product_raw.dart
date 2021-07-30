class ProductRaw {
  final String id;
  final String title;
  final String imageUrl;

  ProductRaw(this.id, this.title, this.imageUrl);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
    };
  }

  ProductRaw.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.title = json['title'],
        this.imageUrl = json['imageUrl'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductRaw && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'ProductRaw{id: $id, title: $title}';
  }
}

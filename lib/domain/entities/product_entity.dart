class ProductEntity {
  ProductEntity({
    required this.id,
    required this.description,
    required this.price,
    this.isFavorite = false,
  });

  int id;
  String description;
  int price;
  bool isFavorite;

  @override
  String toString() {
    return 'ProductEntity{id: $id, description: $description, price: $price, isFavorite: $isFavorite}';
  }
}

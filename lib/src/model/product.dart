class Product {
  int? id;
  String? name;
  String? category;
  String? image;
  String? price;
  bool isliked;
  bool isSelected;
  Product(
      {this.id,
      this.name,
      this.category,
      this.price,
      this.isliked = false,
      this.isSelected = false,
      this.image});
}

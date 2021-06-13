part of 'models.dart';

class Product {
  int id;
  String name;
  String cover;
  String description;
  List<String> images;
  String category;
  double price;
  int stock;

  Product(
      {required this.id,
      required this.name,
      required this.cover,
      required this.description,
      required this.images,
      required this.category,
      required this.price,
      required this.stock});
}

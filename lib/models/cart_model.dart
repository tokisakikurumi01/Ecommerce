part of 'models.dart';

class Cart {
  int qty;
  Product product;

  CartCubit selectedCart = CartCubit();
  TextEditingController note = TextEditingController();
  CartCubit noteStatus = CartCubit();

  Cart({
    required this.qty,
    required this.product,
  });
}

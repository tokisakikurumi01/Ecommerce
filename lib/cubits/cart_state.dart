part of 'cubits.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CheckedCart extends CartState {}

class UncheckedCart extends CartState {}

class CartValue extends CartState {
  final List<Cart> cartList;

  const CartValue(this.cartList);

  @override
  List<Object> get props => [cartList];
}

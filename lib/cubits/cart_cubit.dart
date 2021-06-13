part of 'cubits.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartValue([]));

  selectedCart() {
    emit(CheckedCart());
  }

  unSelectedCart() {
    emit(UncheckedCart());
  }

  void checkSelectAll(List<Cart> data) {
    bool val = false;

    for (var i = 0; i < data.length; i++) {
      if (data[i].selectedCart.state is CheckedCart) {
        val = true;
      }
    }

    changeCart(val);
  }

  void changeCart(bool value) {
    if (value) {
      emit(CheckedCart());
    } else {
      emit(UncheckedCart());
    }
  }

  void deleteCart(List<Cart> dataRaw, int index) {
    List<Cart> dataExisting = dataRaw;
    dataExisting.removeAt(index);
    emit(CartValue(dataExisting));
  }

  void minQty(List<Cart> dataRaw, int index) {
    if (dataRaw[index].qty > 1) {
      dataRaw[index].qty--;
    }
  }

  void addQty(List<Cart> dataRaw, int index) {
    dataRaw[index].qty++;
  }

  void addToCart(BuildContext context, {required Product product}) {
    CartState cartState = BlocProvider.of<CartCubit>(context).state;

    if (cartState is CartValue) {
      List<Cart> existingData = cartState.cartList;

      bool updated = false;

      for (var i = 0; i < existingData.length; i++) {
        if (existingData[i].product.id == product.id) {
          updated = true;
          existingData[i].qty++;
        }
      }
      if (updated == false) {
        existingData.add(Cart(qty: 1, product: product));
      }

      emit(CartValue(existingData));
    }
  }
}

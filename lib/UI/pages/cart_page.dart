part of 'pages.dart';

class CartPage extends StatefulWidget {
  final bool? usingBackButton;
  CartPage({Key? key, this.usingBackButton}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartCubit selectAll = CartCubit();
  CartCubit? cartCubit;

  @override
  void initState() {
    super.initState();
    setState(() {
      cartCubit = BlocProvider.of<CartCubit>(context);
      CartState cartCubitState = cartCubit!.state;
      if (cartCubitState is CartValue) {
        bool selectAllTemp = false;
        for (var i = 0; i < cartCubitState.cartList.length; i++) {
          if (cartCubitState.cartList[i].selectedCart.state is CheckedCart) {
            selectAllTemp = true;
          }
        }
        selectAll.changeCart(selectAllTemp);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      bloc: cartCubit,
      builder: (context, state) {
        if (state is CartValue) {
          List<Cart> listCart = state.cartList;

          if (listCart.length > 0) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: _buildAppBar(listCart),
              body: _buildContent(listCart),
              bottomNavigationBar: _buildBottomNavigationBar(listCart),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: _buildAppBar(listCart),
              body: Center(
                child: Center(
                    child: Container(
                  width: 70.0.w,
                  height: 70.0.w,
                  child: Image.asset(
                    Assetvalue.emptyCart,
                    fit: BoxFit.cover,
                  ),
                )),
              ),
            );
          }
        }
        return Container();
      },
    );
  }

  Widget _buildBottomNavigationBar(List<Cart> dataCart) {
    double totalPayment = 0;
    int totalCart = 0;

    for (var i = 0; i < dataCart.length; i++) {
      if (dataCart[i].selectedCart.state is CheckedCart) {
        totalCart = totalCart + dataCart[i].qty;
        totalPayment =
            totalPayment + (dataCart[i].qty * dataCart[i].product.price);
      }
    }
    return Container(
        width: 100.0.w,
        height: 10.0.h,
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total',
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      color: Colors.black54,
                    )),
                Text(FunctionHelper.moneyChanger(totalPayment),
                    style: TextStyle(
                        fontSize: 12.0.sp,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold))
              ],
            ),
            GestureDetector(
              onTap: () {
                List<Cart> finalData = [];
                for (var i = 0; i < dataCart.length; i++) {
                  if (dataCart[i].selectedCart.state is CheckedCart) {
                    finalData.add(dataCart[i]);
                  }
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CheckoutPage(
                              listData: finalData,
                            )));
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 8.0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: totalCart == 0
                        ? Colors.grey
                        : Theme.of(context).primaryColor),
                child: Text(
                  totalCart == 0 ? 'Beli' : 'Beli ($totalCart)',
                  style: TextStyle(
                      fontSize: 13.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }

  AppBar _buildAppBar(List<Cart> dataCart) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 13.0.h,
        title: Column(
          children: [
            Container(
                width: 100.0.w,
                height: 8.0.h,
                child: Row(
                  children: [
                    widget.usingBackButton == null
                        ? SizedBox(width: 5.0.w)
                        : BackButton(
                            color: Theme.of(context).primaryColor,
                          ),
                    Text('Keranjang',
                        style: TextStyle(
                            fontSize: 14.0.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold))
                  ],
                )),
            Container(
                width: 100.0.w,
                height: 5.0.h,
                padding: EdgeInsets.only(right: 5.0.w),
                child: dataCart.length == 0
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: selectAll.state is CheckedCart,
                                  onChanged: (value) {
                                    setState(() {
                                      selectAll.changeCart(value!);
                                      for (var i = 0;
                                          i < dataCart.length;
                                          i++) {
                                        dataCart[i]
                                            .selectedCart
                                            .changeCart(value);
                                      }
                                    });
                                  }),
                              Text('Pilih Semua',
                                  style: TextStyle(
                                      fontSize: 12.0.sp, color: Colors.black87))
                            ],
                          ),
                          selectAll.state is CheckedCart
                              ? GestureDetector(
                                  onTap: () {
                                    YesOrNoDialog.show(context,
                                            title: 'Hapus Semua?',
                                            desc:
                                                'Hapus Semua Produk di Keranjang?')
                                        .then((value) {
                                      if (value) {
                                        setState(() {
                                          for (var i = 0;
                                              i < dataCart.length;
                                              i++) {
                                            dataCart[i]
                                                .selectedCart
                                                .deleteCart(dataCart, i);
                                          }
                                        });
                                      }
                                    });
                                  },
                                  child: Text(
                                    'Hapus',
                                    style: TextStyle(
                                        fontSize: 12.0.sp,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : Container()
                        ],
                      ))
          ],
        ));
  }

  Widget _buildContent(List<Cart> dataCart) {
    return _buildCartContent(dataCart);
  }

  Widget _buildCartContent(List<Cart> cartData) {
    List<Widget> listDataCartWidget = [];

    for (var i = 0; i < cartData.length; i++) {
      Cart data = cartData[i];

      listDataCartWidget.add(Container(
          margin: EdgeInsets.only(top: 5.0.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  value: data.selectedCart.state is CheckedCart,
                  onChanged: (value) {
                    setState(() {
                      data.selectedCart.changeCart(value!);
                      selectAll.checkSelectAll(cartData);
                    });
                  }),
              Container(
                width: 25.0.w,
                height: 25.0.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(data.product.cover),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: double.infinity,
                              child: Text(data.product.name,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 12.0.sp,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold))),
                          Text(FunctionHelper.moneyChanger(data.product.price),
                              style: TextStyle(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor)),
                          SizedBox(height: 4.0.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  YesOrNoDialog.show(context,
                                          title: 'Hapus Produk?',
                                          desc: 'Hapus Produk Dari Keranjang?')
                                      .then((value) {
                                    if (value) {
                                      setState(() {
                                        data.selectedCart
                                            .deleteCart(cartData, i);
                                      });
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 8.0.w,
                                ),
                              ),
                              SizedBox(width: 3.0.w),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    data.selectedCart.minQty(cartData, i);
                                  });
                                },
                                child: Container(
                                    width: 12.0.w,
                                    height: 12.0.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: data.qty == 1
                                            ? Colors.grey
                                            : Theme.of(context).primaryColor),
                                    alignment: Alignment.center,
                                    child: Icon(Icons.remove,
                                        color: Colors.white)),
                              ),
                              Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 5.0.w),
                                  child: Text(data.qty.toString())),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    data.selectedCart.addQty(cartData, i);
                                  });
                                },
                                child: Container(
                                    width: 12.0.w,
                                    height: 12.0.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context).primaryColor),
                                    alignment: Alignment.center,
                                    child:
                                        Icon(Icons.add, color: Colors.white)),
                              )
                            ],
                          )
                        ],
                      )))
            ],
          )));
    }

    return SingleChildScrollView(
        child: Column(
      children: listDataCartWidget,
    ));
  }
}

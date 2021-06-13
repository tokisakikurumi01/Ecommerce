part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final List<Cart> dataCart;

  PaymentPage({Key? key, required this.dataCart}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  double totalPayment = 0;
  double deliveryFee = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildContent(),
      bottomNavigationBar: _buildBottomNavBar(),
    ));
  }

  Widget _buildBottomNavBar() {
    return Container(
        width: 100.0.w,
        height: 10.0.h,
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ], color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Bayar',
                    style: TextStyle(fontSize: 12.0.sp, color: Colors.black54)),
                Text(FunctionHelper.moneyChanger(deliveryFee + totalPayment),
                    style: TextStyle(
                        fontSize: 12.0.sp,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold))
              ],
            ),
            GestureDetector(
              onTap: () {
                CartState cartState = BlocProvider.of<CartCubit>(context).state;

                if (cartState is CartValue) {
                  for (var i = 0; i < cartState.cartList.length; i++) {
                    cartState.cartList[i].selectedCart
                        .deleteCart(cartState.cartList, i);
                  }
                }

                Fluttertoast.showToast(msg: 'Transaksi Selesai!');

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => MainPage()),
                    (route) => false);
              },
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 2.0.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor),
                  child: Row(
                    children: [
                      Icon(
                        Icons.security,
                        size: 2.5.h,
                        color: Colors.white,
                      ),
                      SizedBox(width: 1.0.w),
                      Text('Bayar',
                          style: TextStyle(
                              fontSize: 13.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
            )
          ],
        ));
  }

  Widget _buildContent() {
    Widget _paymentMethod() {
      return Container(
          padding: EdgeInsets.all(5.0.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Metode Pembayaran',
                      style: TextStyle(
                          fontSize: 13.0.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                  Text('Lihat Semua',
                      style: TextStyle(
                          fontSize: 12.0.sp,
                          color: Theme.of(context).primaryColor))
                ],
              ),
              SizedBox(height: 3.0.w),
              Row(
                children: [
                  Container(
                      width: 20.0.w,
                      height: 10.0.w,
                      child: Image.asset(Assetvalue.bcaLogo)),
                  SizedBox(width: 3.0.w),
                  Text('BCA Virtual Account',
                      style: TextStyle(
                          fontSize: 13.0.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500))
                ],
              )
            ],
          ));
    }

    Widget _paymentDetail() {
      totalPayment = 0;
      deliveryFee = 0;
      for (var i = 0; i < widget.dataCart.length; i++) {
        totalPayment = totalPayment +
            (widget.dataCart[i].qty * widget.dataCart[i].product.price);
        deliveryFee = deliveryFee + 12000;
      }
      Widget buildSummaryPaymentData(
          {required String title, required String harga}) {
        return Container(
          margin: EdgeInsets.only(top: 2.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 11.0.sp, color: Colors.black54)),
              Text(harga,
                  style: TextStyle(fontSize: 11.0.sp, color: Colors.black87))
            ],
          ),
        );
      }

      return Container(
          padding: EdgeInsets.all(5.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ringkasan Pembayaran',
                  style: TextStyle(
                      fontSize: 13.0.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold)),
              buildSummaryPaymentData(
                  harga: FunctionHelper.moneyChanger(totalPayment),
                  title: 'Total Harga'),
              buildSummaryPaymentData(
                  harga: FunctionHelper.moneyChanger(deliveryFee),
                  title: 'Total Ongkos Kirim'),
              Container(
                  width: double.infinity,
                  height: 0.2.w,
                  color: Colors.black12,
                  margin: EdgeInsets.symmetric(vertical: 3.0.w)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Bayar',
                      style: TextStyle(
                          fontSize: 13.0.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                  Text(FunctionHelper.moneyChanger(totalPayment + deliveryFee),
                      style: TextStyle(
                          fontSize: 13.0.sp,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ));
    }

    Widget _addressDetail() {
      return Container(
          padding: EdgeInsets.all(5.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ringkasan Pengiriman',
                  style: TextStyle(
                      fontSize: 13.0.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 3.0.w),
              Text('Rumah',
                  style: TextStyle(fontSize: 12.0.sp, color: Colors.black87)),
              SizedBox(
                width: 90.0.w,
                child: Text(
                    'Jl. Tugu Monas, Gambir, Jakarta Pusat, DKI Jakarta, Indonesia, 10110.',
                    style: TextStyle(
                      fontSize: 11.0.sp,
                      color: Colors.black54,
                    )),
              )
            ],
          ));
    }

    Widget _transactionDetail() {
      List<Widget> goodsWidget = [];
      for (var i = 0; i < widget.dataCart.length; i++) {
        Cart data = widget.dataCart[i];
        goodsWidget.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 15.0.w,
                  height: 15.0.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(data.product.cover),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 3.0.w),
                SizedBox(
                  width: 40.0.w,
                  child: Column(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Text(data.product.name,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(height: 1.0.w),
                      SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text(
                                  FunctionHelper.moneyChanger(
                                      data.product.price),
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 10.0.sp,
                                    color: Theme.of(context).primaryColor,
                                  )),
                              Text(' x ' + data.qty.toString(),
                                  style: TextStyle(
                                      fontSize: 10.0.sp, color: Colors.black54))
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
            Text(FunctionHelper.moneyChanger(data.qty * data.product.price),
                style: TextStyle(
                    fontSize: 11.0.sp,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold))
          ],
        ));
      }
      return Container(
          padding: EdgeInsets.all(5.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ringkasan Barang Dibeli',
                  style: TextStyle(
                      fontSize: 13.0.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 3.0.w),
              Column(
                children: goodsWidget,
              )
            ],
          ));
    }

    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _paymentMethod(),
        Container(width: 100.0.w, height: 1.0.w, color: Colors.black12),
        _paymentDetail(),
        Container(width: 100.0.w, height: 1.0.w, color: Colors.black12),
        _addressDetail(),
        Container(width: 100.0.w, height: 1.0.w, color: Colors.black12),
        _transactionDetail()
      ],
    ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      titleSpacing: 0,
      elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(color: Colors.grey),
          Text('Metode Pembayaran',
              style: TextStyle(
                  fontSize: 13.0.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

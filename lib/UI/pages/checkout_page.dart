part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final List<Cart> listData;
  CheckoutPage({Key? key, required this.listData}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
      bottomNavigationBar: _buildBottomNavBar(),
      backgroundColor: Colors.white,
    ));
  }

  Widget _buildBottomNavBar() {
    double totalPayment = 0;

    for (var i = 0; i < widget.listData.length; i++) {
      totalPayment = totalPayment +
          (widget.listData[i].qty * widget.listData[i].product.price) +
          12000;
    }

    return Container(
        width: 100.0.w,
        height: 10.0.h,
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Bayar',
                    style: TextStyle(fontSize: 12.0.sp, color: Colors.black54)),
                Text(FunctionHelper.moneyChanger(totalPayment),
                    style: TextStyle(
                        fontSize: 12.0.sp,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold))
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PaymentPage(
                              dataCart: widget.listData,
                            )));
              },
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 2.0.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor),
                  child: Text('Lakukan Pembayaran',
                      style: TextStyle(
                          fontSize: 11.0.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
            )
          ],
        ));
  }

  Widget _buildContent() {
    Widget _buildAddress() {
      return Container(
        padding: EdgeInsets.all(5.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pesanan Dikirim Ke',
                style: TextStyle(
                    fontSize: 13.0.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 3.0.w),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rumah',
                        style: TextStyle(
                            fontSize: 12.0.sp, color: Colors.black87)),
                    SizedBox(
                      width: 70.0.w,
                      child: Text(
                          'Jl. Tugu Monas, Gambir, Jakarta Pusat, DKI Jakarta, Indonesia, 10110.',
                          style: TextStyle(
                            fontSize: 11.0.sp,
                            color: Colors.black54,
                          )),
                    )
                  ],
                ),
                Container(
                    width: 20.0.w,
                    alignment: Alignment.centerRight,
                    child: Text('Ubah',
                        style: TextStyle(
                            fontSize: 12.0.sp,
                            color: Theme.of(context).primaryColor)))
              ],
            )
          ],
        ),
      );
    }

    Widget _buildListCart() {
      List<Widget> listCartWidget = [];

      for (var i = 0; i < widget.listData.length; i++) {
        Cart data = widget.listData[i];
        listCartWidget.add(Container(
            width: 100.0.w,
            padding: EdgeInsets.only(left: 5.0.w, top: 5.0.w),
            child: Row(
              children: [
                Container(
                    width: 20.0.w,
                    height: 20.0.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(data.product.cover),
                            fit: BoxFit.cover))),
                SizedBox(width: 3.0.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 67.0.w,
                        child: Text(data.product.name,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12.0.sp,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 1.0.w),
                    Text('Qty : ' + data.qty.toString(),
                        style: TextStyle(
                            fontSize: 11.0.sp, color: Colors.black54)),
                    Text(
                        'Subtotal : ' +
                            FunctionHelper.moneyChanger(
                                data.qty * data.product.price),
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          color: Colors.blue,
                        )),
                    // Container(
                    //   width: 67.0.w,
                    //   height: 0.5.w,
                    //   margin: EdgeInsets.symmetric(vertical: 3.0.w),
                    //   color: Colors.black12,
                    // ),
                    SizedBox(height: 2.0.w),

                    Card(
                      child: Container(
                        width: 66.0.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.0.w, vertical: 3.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.delivery_dining,
                                  color: Colors.grey,
                                  size: 8.0.w,
                                ),
                                SizedBox(width: 3.0.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Pilih Pengiriman',
                                        style: TextStyle(
                                            fontSize: 12.0.sp,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 0.2.w),
                                    Text('JNE - YES (Rp12.000)',
                                        style: TextStyle(
                                            fontSize: 9.0.sp,
                                            color: Colors.black54)),
                                  ],
                                )
                              ],
                            ),
                            Text('Ubah',
                                style: TextStyle(
                                    fontSize: 12.0.sp, color: Colors.blue))
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )));
      }
      return Column(
        children: listCartWidget,
      );
    }

    return SingleChildScrollView(
        child: Column(
      children: [
        _buildAddress(),
        Container(
          width: 100.0.w,
          height: 1.0.w,
          color: Colors.black12,
        ),
        _buildListCart()
      ],
    ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(
            color: Colors.grey,
          ),
          Text('Checkout',
              style: TextStyle(
                  fontSize: 13.0.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87))
        ],
      ),
    );
  }
}

part of 'pages.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Product? data;
  PageController pageController = PageController();

  @override
  void initState() {
    setState(() {
      data = widget.product;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
      bottomNavigationBar: _buildBottomNavBar(),
    ));
  }

  Widget _buildBottomNavBar() {
    return Container(
        height: 10.0.h,
        width: 100.0.w,
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.blue, width: 0.3.w))
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey,
            //     offset: Offset(0.0, 1.0), //(x,y)
            //     blurRadius: 6.0,
            //   ),
            // ],
            ),
        child: Row(
          children: [
            Flexible(
                flex: 14,
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<CartCubit>(context)
                        .addToCart(context, product: data!);
                    Fluttertoast.showToast(
                        msg: 'Berhasil Menambah Produk Ke Keranjang');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 7.0.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue, width: 0.5.w)),
                    alignment: Alignment.center,
                    child: Text('Tambah Ke Keranjang',
                        style: TextStyle(
                            fontSize: 10.0.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  ),
                )),
            Flexible(flex: 1, child: Container()),
            Flexible(
                flex: 14,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CheckoutPage(listData: [
                                  Cart(product: widget.product, qty: 1)
                                ])));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 7.0.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    alignment: Alignment.center,
                    child: Text('Beli Sekarang',
                        style: TextStyle(
                            fontSize: 10.0.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ))
          ],
        ));
  }

  Widget _buildContent() {
    Widget _buildPhotoPreview() {
      List<Widget> dataImagePreview = [];
      for (var i = 0; i < data!.images.length; i++) {
        dataImagePreview.add(Container(
          width: 100.0.w,
          height: 100.0.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(data!.images[i]), fit: BoxFit.cover)),
        ));
      }

      return Hero(
          tag: 'image_preview',
          child: Container(
              width: 100.0.w,
              height: 100.0.w,
              child: PageView(
                controller: pageController,
                reverse: true,
                children: dataImagePreview,
              )));
    }

    Widget _buildBasicInformation() {
      return Container(
          margin: EdgeInsets.all(5.0.w),
          width: 90.0.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(FunctionHelper.moneyChanger(data!.price),
                  style: TextStyle(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
              SizedBox(
                height: 2.0.w,
              ),
              Text(data!.name,
                  style: TextStyle(
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.7))),
              SizedBox(height: 2.0.w),
              Text(
                'Stock: ' + data!.stock.toString(),
                style: TextStyle(fontSize: 12.0.sp, color: Colors.black54),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3.0.w),
                width: double.infinity,
                height: 0.5.w,
                color: Colors.black12,
              ),
              Text(
                'Deskripsi',
                style: TextStyle(
                    fontSize: 16.0.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2.0.w),
              Text(data!.description,
                  style: TextStyle(fontSize: 11.0.sp, color: Colors.black87)),
              SizedBox(
                height: 3.0.h,
              ),
            ],
          ));
    }

    return SingleChildScrollView(
      child: Column(
        children: [_buildPhotoPreview(), _buildBasicInformation()],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: 10.0.h,
      title: Container(
        width: 100.0.w,
        child: Row(children: [
          BackButton(
            color: Colors.blue,
          ),
          Expanded(
              child: Row(
            children: [
              Flexible(
                flex: 5,
                child: GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: 'Coming Soon');
                  },
                  child: Container(
                      width: double.infinity,
                      height: 7.0.h,
                      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.black26, width: 0.2.w)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.black26,
                              ),
                              SizedBox(width: 2.0.w),
                              Text(
                                'Cari Sesuatu...',
                                style: TextStyle(
                                    fontSize: 12.0.sp, color: Colors.black45),
                              )
                            ],
                          ),
                          Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.grey,
                          )
                        ],
                      )),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CartPage(
                                    usingBackButton: true,
                                  )));
                    },
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Icon(Icons.shopping_cart_rounded,
                            color: Colors.grey)),
                  ))
            ],
          ))
        ]),
      ),
    );
  }
}

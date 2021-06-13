part of 'pages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  double scrollProgress = 0;
  TabController? tabController;
  int tabSelection = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 7, vsync: this);
    scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (scrollController.offset <= 100) {
      setState(() {
        scrollProgress = scrollController.offset;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildContent(),
    ));
  }

  Widget _buildContent() {
    Widget _buildBanner() {
      return Container(
        margin: EdgeInsets.only(
            left: 5.0.w, right: 5.0.w, top: 2.0.w, bottom: 2.0.w),
        width: 90.0.w,
        height: 45.0.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
            image: DecorationImage(
                image: AssetImage('assets/images/banner.jpeg'),
                fit: BoxFit.cover)),
      );
    }

    Widget _buildCategory() {
      List<Widget> dataTabs = [];

      for (var index = 0; index < DummyData.categoryData.length; index++) {
        dataTabs.add(Stack(
          children: [
            Container(
                margin: EdgeInsets.only(
                    left: index == 0 ? 5.0.w : 3.0.w,
                    right:
                        index == DummyData.categoryData.length - 1 ? 5.0.w : 0),
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                height: (((100 - scrollProgress) / 100) * 20.0.w) + 12.0.w,
                decoration: index == DummyData.categoryData.length - 1
                    ? BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10))
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                        image: DecorationImage(
                            image: AssetImage(
                                DummyData.categoryData[index]['cover']!),
                            fit: BoxFit.cover)),
                alignment: Alignment.center,
                child: index == DummyData.categoryData.length - 1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          scrollProgress <= 50
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 3.0.w),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                          Text(
                            DummyData.categoryData[index]['title']!,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    : Text(DummyData.categoryData[index]['title']!)),
            Container(
                margin: EdgeInsets.only(
                    left: index == 0 ? 5.0.w : 3.0.w,
                    right:
                        index == DummyData.categoryData.length - 1 ? 5.0.w : 0),
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                height: (((100 - scrollProgress) / 100) * 20.0.w) + 12.0.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == DummyData.categoryData.length - 1
                      ? Colors.transparent
                      : Colors.black54,
                ),
                alignment: Alignment.center,
                child: index == DummyData.categoryData.length - 1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          scrollProgress <= 50
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 3.0.w),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                          Text(
                            DummyData.categoryData[index]['title']!,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    : Text(DummyData.categoryData[index]['title']!)),
          ],
        ));
      }

      return Container(
        margin: EdgeInsets.symmetric(vertical: 3.0.w),
        child: TabBar(
            isScrollable: true,
            onTap: (value) {
              if (value == DummyData.categoryData.length - 1) {
                Fluttertoast.showToast(msg: 'Coming Soon');
              } else {
                setState(() {
                  tabSelection = value;
                });
              }
            },
            controller: tabController,
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            unselectedLabelColor: Colors.white38,
            indicatorWeight: 0.001,
            tabs: dataTabs),
      );
    }

    Widget _buildProduct() {
      List<Widget> dataProduct = [];

      for (var i = 0; i < DummyData.dataProduct.length; i++) {
        Product data = DummyData.dataProduct[i];
        if (tabSelection == 0 ||
            DummyData.categoryData[tabSelection]['title'] == data.category) {
          dataProduct.add(GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProductDetailPage(
                            product: data,
                          )));
            },
            child: Card(
                child: Container(
                    width: 42.5.w,
                    height: 63.0.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Hero(
                              tag: 'image_preview',
                              child: Container(
                                width: 42.5.w,
                                height: 42.5.w,
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    image: DecorationImage(
                                        image: AssetImage(data.cover),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        topRight: Radius.circular(4))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.0.w,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                          child: Text(
                            data.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 11.0.sp,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                          margin: EdgeInsets.only(top: 1.0.w),
                          child: Text(
                            FunctionHelper.moneyChanger(data.price),
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 12.0.sp,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ))),
          ));
        }
      }

      return Expanded(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0.w),
            child: Wrap(
              runSpacing: 2.0.w,
              children: dataProduct,
            ),
          ),
        ),
      );
    }

    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (context, _) {
        return [
          SliverToBoxAdapter(
              child: Container(color: Colors.white, child: _buildBanner()))
        ];
      },
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildCategory(), _buildProduct()],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 10.0.h,
      elevation: scrollProgress / 20,
      backgroundColor: Colors.white,
      title: GestureDetector(
        onTap: () {
          Fluttertoast.showToast(msg: 'Coming Soon');
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 80.0.w,
                  height: 7.0.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black26, width: 0.2.w)),
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
              Icon(
                Icons.notifications,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}

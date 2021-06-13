part of 'pages.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0; // to keep track of active tab index
  final List<Widget> pageList = [
    HomePage(),
    CartPage(),
    ComingSoonPage(),
    ComingSoonPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: pageList[_selectedPage],
      bottomNavigationBar: BottomAppBar(
          notchMargin: 5,
          elevation: 10,
          child: SizedBox(height: 8.0.h, child: buildNavigator())),
    ));
  }

  Widget buildNavigator() {
    Widget buildNavigatorData(
        {required IconData icons, required String title, required int index}) {
      return Flexible(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _selectedPage = index;
            });
          },
          child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icons,
                    size: _selectedPage == index ? 7.5.w : 7.0.w,
                    color: _selectedPage == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                  Text(title,
                      style: TextStyle(
                        fontSize: _selectedPage == index ? 11.0.sp : 10.0.sp,
                        fontWeight: _selectedPage == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: _selectedPage == index
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ))
                ],
              )),
        ),
      );
    }

    return Container(
        width: 100.0.w,
        height: 8.0.h,
        child: Row(
          children: [
            buildNavigatorData(icons: Icons.home, index: 0, title: 'Beranda'),
            buildNavigatorData(
                icons: Icons.shopping_cart_rounded,
                index: 1,
                title: 'Keranjang'),
            buildNavigatorData(icons: Icons.message, index: 2, title: 'Pesan'),
            buildNavigatorData(
                icons: Icons.account_circle, index: 3, title: 'Profile'),
          ],
        ));
  }
}

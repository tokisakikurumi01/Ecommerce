part of 'pages.dart';

class FinishPaymentPage extends StatefulWidget {
  FinishPaymentPage({Key? key}) : super(key: key);

  @override
  _FinishPaymentPageState createState() => _FinishPaymentPageState();
}

class _FinishPaymentPageState extends State<FinishPaymentPage> {
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
    return SingleChildScrollView(
        child: Column(
      children: [],
    ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(
            color: Colors.grey,
          ),
          Text('Selesaikan Pembayaran',
              style: TextStyle(
                  fontSize: 13.0.sp,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}

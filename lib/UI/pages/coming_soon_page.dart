part of 'pages.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Coming Soon',
        style: TextStyle(fontSize: 12.0.sp, color: Colors.blue),
      )),
    );
  }
}

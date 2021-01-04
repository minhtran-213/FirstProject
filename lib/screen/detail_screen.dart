import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/detail screen';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 219,
                    child: CustomPaint(
                      painter: MyPainter(),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 100,
                    child: Container(
                      child: Image(
                        height: 200,
                        width: 200,
                        image: AssetImage(args['avatarUrl']),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            buildColumn('Name: ', args['name'].toString()),
            buildColumn('DOB: ', args['dob'].toString()),
            buildColumn('Gender', args['gender'].toString()),
            buildColumn('Phone number', args['phoneNumber'].toString()),
            buildColumn('Description', args['description']),
          ],
        ),
      ),
      // Positioned(
      //   top: 100,
      //   left: 100,
      //   child: Container(
      //     child: Image(
      //       height: 200,
      //       width: 200,
      //       image: AssetImage(args['avatarUrl']),
      //       fit: BoxFit.contain,
      //     ),
      //   ),
      // ),
    );
  }

  Column buildColumn(String title, String text) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 19),
          child: Row(
            children: <Widget>[
              Container(
                width: 90,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(left: 76, right: 2),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xFFA5C3FA)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

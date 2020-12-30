import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/detail screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 219,
                child: CustomPaint(
                  painter: MyPainter(),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              buildColumn('Name: ', 'Chris Evans'),
              buildColumn('DOB: ', '18/05/1985'),
              buildColumn('Gender', 'Male'),
              buildColumn('Phone number', '0919284586'),
              buildColumn('Description',
                  'America’s World War II Super-Soldier con tinues his fight in the present as an Avenger and untiring sentinel of liberty.'),
            ],
          ),
          Positioned(
            top: 100,
            left: 100,
            child: Container(
              child: Image(
                image: AssetImage('assets/images/png/big_avatar.png'),
              ),
            ),
          ),
        ],
      ),
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

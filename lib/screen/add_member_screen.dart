import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class CreateMember extends StatelessWidget {
  String _checkFormat(value) {
    if (value.isEmpty) return 'Please enter some text';
    return null;
  }

  Widget buildTexFormField(String hintText, Widget suffixIcon,
      TextEditingController controller, TextInputType keyboardType) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
        validator: _checkFormat,
      ),
    );
  }

  static const routeName = '/add member';
  @override
  Widget build(BuildContext context) {
    //final String memID = ModalRoute.of(context).settings.arguments as String;
    //final selectMem = DUMMY_MEMBER.firstWhere((mem) => memID == mem.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryTextColor),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset('assets/images/svg/checked_icon.svg'),
            onPressed: null,
          ),
        ],
        title: Text(
          'CREATE MEMBER',
          style: TextStyle(color: primaryTextColor, fontSize: 30),
        ),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Image(
                image: AssetImage('assets/images/png/avatar.png'),
              ),
            ),
            buildTexFormField('Name', null, null, TextInputType.name),
            buildTexFormField('Phone', null, null, TextInputType.phone),
            buildTexFormField('Gender', null, null, TextInputType.text),
            buildTexFormField('Description', null, null, TextInputType.text),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_1/constants.dart';
import 'package:project_1/dummy_data.dart';

// import 'package:project_1/model/member.dart';
// import 'package:project_1/screen/add_member_screen.dart';
// import 'package:project_1/widget/member_card.dart';
import 'package:provider/provider.dart';

import '../dummy_data.dart';

class Members extends StatefulWidget {
  static const routeName = '/member screen';
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  // List<Member> members = [];

  // void _addNewMember(
  //   String name,
  //   String phoneNumber,
  //   String gender,
  //   String dob,
  //   String description,
  // ) {
  //   final newMember = new Member(
  //     description: description,
  //     gender: gender,
  //     name: name,
  //     phoneNumber: phoneNumber,
  //     dob: dob,
  //   );
  //   setState(() {
  //     members.add(newMember);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var members = Provider.of<DummyData>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryTextColor),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset('assets/images/svg/plus_icon.svg'),
              onPressed: () {}),
        ],
        title: Text(
          'MEMBERS',
          style: TextStyle(color: primaryTextColor, fontSize: 30),
        ),
      ),
      drawer: Drawer(),
      body: members.dummy_member.isEmpty
          ? Center(
              child: Text('Nothing in here'),
            )
          : ListView.builder(
              itemCount: members.dummy_member.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(members.dummy_member[index].name),
                );
              },
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_1/constants.dart';
import 'package:project_1/model/member.dart';
import 'package:project_1/screen/add_member_screen.dart';
import 'package:project_1/screen/detail_screen.dart';
import 'package:project_1/screen/dummy_data.dart';
import 'package:project_1/screen/login_page.dart';

// import 'package:project_1/model/member.dart';
// import 'package:project_1/screen/add_member_screen.dart';
// import 'package:project_1/widget/member_card.dart';
// import 'package:provider/provider.dart';

import 'dummy_data.dart';

class Members extends StatefulWidget {
  static const routeName = '/members screen';

  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  var members = DummyData().dummy_member;

  void _addNewMember(String name, String phoneNumber, String gender, String dob,
      String description, String avatarUrl) {
    final newMember = new Member(
      description: description,
      gender: gender,
      name: name,
      phoneNumber: phoneNumber,
      dob: dob,
      avatarUrl: avatarUrl,
    );
    setState(() {
      members.add(newMember);
      print('${newMember.name}: ${newMember.avatarUrl}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // var members = Provider.of<DummyData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryTextColor),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset('assets/images/svg/plus_icon.svg'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => CreateMember(addNewMember: _addNewMember),
                ),
              );
            },
          ),
        ],
        title: Text(
          'MEMBERS',
          style: TextStyle(color: primaryTextColor, fontSize: 30),
        ),
      ),
      drawer: Drawer(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(LoginPage.routeName);
          },
          child: Center(
            child: Text('Log out'),
          ),
        ),
      ),
      body: members.isEmpty
          ? Center(
              child: Text('Nothing in here'),
            )
          : ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DetailsScreen.routeName,
                        arguments: {
                          'name': members[index].name,
                          'avatarUrl': members[index].avatarUrl,
                          'description': members[index].description,
                          'gender': members[index].gender,
                          'dob': members[index].dob,
                          'phoneNumber': members[index].phoneNumber,
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(members[index].name),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(members[index].avatarUrl),
                        ),
                        subtitle: Text(members[index].dob),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

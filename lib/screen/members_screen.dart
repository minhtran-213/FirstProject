import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_1/constants.dart';
import 'package:project_1/dummy_data.dart';
import 'package:project_1/screen/add_member_screen.dart';
import 'package:project_1/screen/login_page.dart';
import 'package:project_1/utils/shared_preferences.dart';
import 'package:project_1/widget/member_card.dart';

class Members extends StatelessWidget {
  static const routeName = '/member screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryTextColor),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset('assets/images/svg/plus_icon.svg'),
            onPressed: () =>
                Navigator.of(context).pushNamed(CreateMember.routeName),
          ),
        ],
        title: Text(
          'MEMBERS',
          style: TextStyle(color: primaryTextColor, fontSize: 30),
        ),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 23,
                top: 72,
                right: 28,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: DUMMY_MEMBER
                    .map(
                      (memData) => MemberCard(
                          memData.name, memData.phoneNumber, memData.avatarUrl),
                    )
                    .toList(),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                SharedPreference.prefs.setBool('loggedIn', false);
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              },
              child: Icon(Icons.exit_to_app),
            )
          ],
        ),
      ),
    );
  }
}

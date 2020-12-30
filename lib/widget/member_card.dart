import 'package:flutter/material.dart';
import 'package:project_1/constants.dart';
import 'package:project_1/screen/detail_screen.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String avatarUrl;
  MemberCard(this.name, this.phoneNumber, this.avatarUrl);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            print('this $name is tapped');
            Navigator.of(context).pushNamed(DetailsScreen.routeName);
          },
          splashColor: primaryColor,
          child: Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 8, top: 6, bottom: 6),
                  child: Image(
                    image: AssetImage(avatarUrl),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        phoneNumber,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

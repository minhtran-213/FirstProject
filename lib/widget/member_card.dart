import 'package:flutter/material.dart';
import 'package:project_1/constants.dart';
import 'package:project_1/screen/detail_screen.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String avatarUrl;
  final String gender;
  final String dob;
  MemberCard(this.name, this.phoneNumber, this.dob, this.gender)
      : avatarUrl = 'assets/images/png/cap_avatar.png';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Flexible(
            child: InkWell(
              onTap: () {
                print('this $name is tapped');
                Navigator.of(context)
                    .pushNamed(DetailsScreen.routeName, arguments: {
                  'name': name,
                  'avatarUrl': avatarUrl,
                  'phoneNumber': phoneNumber,
                  'dob': dob,
                  'gender': gender,
                });
              },
              splashColor: primaryColor,
              child: Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 8, top: 6, bottom: 6),
                        child: Image(
                          image: AssetImage(avatarUrl),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(left: 23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                name,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                phoneNumber,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

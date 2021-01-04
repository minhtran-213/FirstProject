import 'package:flutter/cupertino.dart';

import '../model/member.dart';

class DummyData extends ChangeNotifier {
  final List<Member> dummy_member = [
    Member(
        name: 'Chris Evans',
        gender: 'Male',
        phoneNumber: '0919284586',
        dob: '1705/05/18',
        description:
            'America’s World War II Super-Soldier con tinues his fight in the present as an Avenger and untiring sentinel of liberty.',
        avatarUrl: 'assets/images/png/captain_america.png'),
    Member(
        name: 'Sam Wilson',
        gender: 'Male',
        phoneNumber: '0919309586',
        dob: '1898/06/21',
        description:
            'When Captain America asked Air Force Veteran Sam Wilson for help, Wilson immedsiately agreed. He donned the flight suit he’d used in combat to become the Falcon, setting him on a path towards becoming an Avenger.',
        avatarUrl: 'assets/images/png/the_falcon.png'),
    Member(
        name: 'Bucky Barnes',
        gender: 'Male',
        phoneNumber: '0919309531',
        dob: '1705/05/21',
        description:
            'James Buchanan “Bucky” Barnes enlists to fight in World War II, but eventually literally falls in battle. Unfortunately, the evil Arnim Zola recovers him and erases his memory, turning him into a highly-trained assassin called the Winter Soldier.',
        avatarUrl: 'assets/images/png/winter_soldier.png'),
    Member(
        name: 'Tony Stark',
        gender: 'Male',
        phoneNumber: '0919390871',
        dob: '1890/07/22',
        description:
            'Inventor Tony Stark applies his genius for high-tech solutions to problems as Iron Man, the armored Avenger.',
        avatarUrl: 'assets/images/png/iron_man.png'),
    Member(
        name: 'Wanda Maximoff',
        gender: 'Female',
        phoneNumber: '0919390811',
        dob: '1968/05/28',
        description:
            'Notably powerful, Wanda Maximoff has fought both against and with the Avengers, attempting to hone her abilities and do what she believes is right to help the world.',
        avatarUrl: 'assets/images/png/wandamaximoff.png'),
  ];
  // void addNewMember(Member member) {
  //   dummy_member.add(member);
  //   notifyListeners();
  // }
}

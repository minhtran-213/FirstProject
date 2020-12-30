import 'package:flutter/material.dart';

class Member {
  final String id;
  final String name;
  final String phoneNumber;
  final String description;
  final bool gender;
  final String dob;
  final String avatarUrl;

  const Member({
    @required this.description,
    @required this.dob,
    @required this.gender,
    @required this.id,
    @required this.name,
    @required this.phoneNumber,
    @required this.avatarUrl,
  });
}

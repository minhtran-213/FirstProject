import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_1/screen/image_picker.dart';

import '../constants.dart';

class CreateMember extends StatefulWidget {
  final Function addNewMember;

  CreateMember({this.addNewMember});

  static const routeName = '/add member';

  @override
  _CreateMemberState createState() => _CreateMemberState();
}

class _CreateMemberState extends State<CreateMember> {
  final _nameController = TextEditingController();

  final _phoneController = TextEditingController();

  final _genderController = TextEditingController();

  final _descriptionController = TextEditingController();

  final _dobController = TextEditingController();

  String _checkFormat(value) {
    if (value.isEmpty) return 'Please enter some text';
    return null;
  }

  void _submitData() {
    final enteredName = _nameController.text;
    final enteredPhone = _phoneController.text;
    final enteredGender = _genderController.text;
    final enteredDescription = _descriptionController.text;
    final enteredDOB = _dobController.text;
    final avatarUrl = 'assets/images/png/cap_avatar.png';
    widget.addNewMember(enteredName, enteredPhone, enteredGender, enteredDOB,
        enteredDescription, avatarUrl);
    Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    //final String memID = ModalRoute.of(context).settings.arguments as String;
    //final selectMem = DUMMY_MEMBER.firstWhere((mem) => memID == mem.id);
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryTextColor),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset('assets/images/svg/checked_icon.svg'),
            onPressed: _submitData,
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
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(ImageCapture.routeName);
                },
                child: Container(
                  height: 195,
                  width: 197,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        args['imageUrl'] ?? 'assets/images/png/avatar.png'),
                  ),
                ),
              ),
            ),
            buildTexFormField(
                'Name', null, _nameController, TextInputType.name),
            buildTexFormField(
                'Phone', null, _phoneController, TextInputType.phone),
            buildTexFormField(
                'Gender', null, _genderController, TextInputType.text),
            buildTexFormField('DOB', null, _dobController, TextInputType.text),
            buildTexFormField('Description', null, _descriptionController,
                TextInputType.text),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_1/constants.dart';

import 'package:project_1/screen/members_screen.dart';
import 'package:project_1/utils/shared_preferences.dart';
import 'package:project_1/widget/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String _checkUsername(value) {
    if (value != 'admin') return 'Incorrect username';
    return null;
  }

  String _checkPassword(value) {
    if (value != 'admin') return 'Incorrect password';
    return null;
  }

  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                    top: 60,
                    bottom: 80,
                  ),
                  child: Image(
                    image: AssetImage('assets/images/png/image2.png'),
                  ),
                ),
                TextFieldWidget(
                  validator: _checkUsername,
                  controller: _usernameController,
                  hintText: 'Username',
                  obscureText: false,
                  prefixIcon: Icons.person_outline,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                    validator: _checkPassword,
                    controller: _passwordController,
                    obscureText: _isHidden,
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off),
                    )),
                SizedBox(
                  height: 2,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 43,
                  width: 262,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: primaryButtonColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      SharedPreference.prefs.setBool('loggedIn', true);
                      if (formKey.currentState.validate()) {
                        SharedPreference.prefs.setBool('loggedIn', true); 
                        Navigator.pushReplacementNamed(
                            context, Members.routeName);
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

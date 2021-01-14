import 'package:flutter/material.dart';
import 'package:project_1/screen/add_member_screen.dart';
import 'package:project_1/screen/detail_screen.dart';
import 'package:project_1/screen/image_picker.dart';
import 'package:project_1/screen/login_page.dart';
import 'package:project_1/screen/members_screen.dart';
import 'package:project_1/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreference.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'OpenSans',
      ),
      home: SharedPreference.prefs.getBool('loggedIn') == true
          ? Members()
          : LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.routeName: (ctx) => LoginPage(),
        Members.routeName: (ctx) => Members(),
        CreateMember.routeName: (ctx) => CreateMember(),
        DetailsScreen.routeName: (ctx) => DetailsScreen(),
        ImageCapture.routeName: (ctx) => ImageCapture(),
      },
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hub_file_flutter/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hub_file_flutter/Screens/HomePage/home_page.dart';
import 'package:hub_file_flutter/Screens/Authentication/login_page.dart';

SharedPreferences? prefs;
String? userId, userToken;
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loading = true;

  sharedPrefs() async {
    loading = true;
    setState(() {});
    print('in LoginPage shared prefs');
    prefs = await SharedPreferences.getInstance();
    userId = (prefs!.getString('user_id'));
    userToken = (prefs!.getString('user_token'));
    print("userId in LoginPrefs $userId");
    print("userToken in LoginPrefs $userToken");
    if (userId != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    else{
      loading = false;
      setState(() {});
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      print("userId value is = $userId");
    }
  }

  @override
  void initState() {
    super.initState();
    splashNavigator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('hub', style: TextStyle(fontSize: 25, color: kWhite, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(top: 04),
                child: Text('file', style: TextStyle(fontSize: 18, color: kWhite)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  splashNavigator() {
    Timer(Duration(seconds: 3), () {
      sharedPrefs();
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }
}
